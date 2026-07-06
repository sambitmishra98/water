#!/usr/bin/env bash
set -euo pipefail

ROOT="${1:-.}"
OUTDIR="${2:-.llm-context/governance-pack-$(date +%Y%m%d-%H%M%S)}"

ROOT="$(cd "$ROOT" && pwd)"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTDIR_ABS="$ROOT/$OUTDIR"

mkdir -p "$OUTDIR_ABS"

TMP_ROOT="$OUTDIR_ABS/_governance-root"
README_OUT="$OUTDIR_ABS/_readme-inheritance"
AGENTS_OUT="$OUTDIR_ABS/_agents-inheritance"

rm -rf "$TMP_ROOT" "$README_OUT" "$AGENTS_OUT"
mkdir -p "$TMP_ROOT"

python3 - "$ROOT" "$TMP_ROOT" <<'PY'
from pathlib import Path
import shutil
import subprocess
import sys

root = Path(sys.argv[1]).resolve()
tmp_root = Path(sys.argv[2]).resolve()

exclude_names = {
    ".git",
    ".obsidian",
    ".llm-context",
    ".trash",
    "node_modules",
    "bower_components",
    "__pycache__",
    ".pytest_cache",
    ".ipynb_checkpoints",
    "site-packages",
    ".venv",
    ".virtualenv",
    "venv",
    "env",
    "virtualenv",
    "dist",
    "build",
    "target",
    ".next",
    ".vite",
    ".parcel-cache",
    "coverage",
}

exclude_rel_prefixes = {
    ("Supplementary", "on-drive"),
    ("Supplementary", "in-sync"),
}

def git_paths(*args):
    try:
        result = subprocess.run(
            ["git", "-C", str(root), *args],
            check=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.DEVNULL,
        )
    except subprocess.CalledProcessError:
        return []
    return [Path(p.decode()) for p in result.stdout.split(b"\0") if p]

def skip(rel: Path) -> bool:
    if any(part in exclude_names for part in rel.parts):
        return True
    return any(rel.parts[:len(prefix)] == prefix for prefix in exclude_rel_prefixes)

def has_frontmatter_type(path: Path, type_value: str) -> bool:
    try:
        lines = path.read_text(encoding="utf-8", errors="replace").splitlines()
    except Exception:
        return False
    if not lines or lines[0].strip() != "---":
        return False
    target = f"type: {type_value}"
    for line in lines[1:]:
        stripped = line.strip()
        if stripped == "---":
            return False
        if stripped.lower() == target:
            return True
    return False

tracked = git_paths("ls-files", "-z")
untracked = git_paths("ls-files", "--others", "--exclude-standard", "-z")

selected = set()
for rel in tracked + untracked:
    if rel.name not in {"README.md", "AGENTS.md"}:
        continue
    if skip(rel):
        continue

    path = root / rel
    if rel == Path("README.md") or rel == Path("AGENTS.md"):
        selected.add(rel)
    elif rel.name == "README.md" and has_frontmatter_type(path, "readme"):
        selected.add(rel)
    elif rel.name == "AGENTS.md" and has_frontmatter_type(path, "agent-guide"):
        selected.add(rel)

for rel in sorted(selected, key=lambda p: (len(p.parts), str(p).lower())):
    src = root / rel
    dst = tmp_root / rel
    dst.parent.mkdir(parents=True, exist_ok=True)
    shutil.copy2(src, dst)
PY

bash "$SCRIPT_DIR/readme-inheritance-pack.sh" "$TMP_ROOT" "$README_OUT" >/dev/null
bash "$SCRIPT_DIR/agents-inheritance-pack.sh" "$TMP_ROOT" "$AGENTS_OUT" >/dev/null

cp "$README_OUT/00_readme_tree.md" "$OUTDIR_ABS/README_00_readme_tree.md"
cp "$README_OUT/01_readme_pack.md" "$OUTDIR_ABS/README_01_readme_pack.md"
cp "$AGENTS_OUT/00_agents_tree.md" "$OUTDIR_ABS/AGENTS_00_agents_tree.md"
cp "$AGENTS_OUT/01_agents_pack.md" "$OUTDIR_ABS/AGENTS_01_agents_pack.md"

git -C "$ROOT" ls-files -- . \
  ':(exclude)Supplementary/on-drive/**' \
  ':(exclude)Supplementary/in-sync/**' \
  > "$OUTDIR_ABS/git-tracked-files.txt"

git -C "$ROOT" status --short -- . \
  ':(exclude)Supplementary/on-drive/**' \
  ':(exclude)Supplementary/in-sync/**' \
  > "$OUTDIR_ABS/git-status.txt"

{
  echo "# Governance Pack Summary"
  echo
  echo "- root: \`$ROOT\`"
  echo "- generated: $(date +%Y-%m-%dT%H:%M:%S)"
  echo "- readme_tree: \`README_00_readme_tree.md\`"
  echo "- readme_pack: \`README_01_readme_pack.md\`"
  echo "- agents_tree: \`AGENTS_00_agents_tree.md\`"
  echo "- agents_pack: \`AGENTS_01_agents_pack.md\`"
  echo "- git_tracked_files: \`git-tracked-files.txt\`"
  echo "- git_status: \`git-status.txt\`"
  echo
  echo "Private storage excluded from this pack:"
  echo
  echo "- \`Supplementary/on-drive\`"
  echo "- \`Supplementary/in-sync\`"
} > "$OUTDIR_ABS/summary.md"

rm -rf "$TMP_ROOT" "$README_OUT" "$AGENTS_OUT"

echo "Wrote: $OUTDIR_ABS"
echo "Summary: $OUTDIR_ABS/summary.md"
