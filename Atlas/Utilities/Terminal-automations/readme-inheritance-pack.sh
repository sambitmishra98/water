#!/usr/bin/env bash
set -euo pipefail

ROOT="${1:-.}"
OUTDIR="${2:-.llm-context/readme-inheritance-$(date +%Y%m%d-%H%M%S)}"

mkdir -p "$OUTDIR"

python3 - "$ROOT" "$OUTDIR" <<'PY'
from pathlib import Path
import sys
from datetime import datetime

root = Path(sys.argv[1]).resolve()
outdir = Path(sys.argv[2]).resolve()

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
    ("Supplementary", "on-drive", "profession", "software"),
}

def skip(path: Path) -> bool:
    try:
        rel = path.relative_to(root)
    except ValueError:
        return True
    if any(part in exclude_names for part in rel.parts):
        return True
    return any(rel.parts[:len(prefix)] == prefix for prefix in exclude_rel_prefixes)

def has_readme_frontmatter(path: Path) -> bool:
    try:
        lines = path.read_text(encoding="utf-8", errors="replace").splitlines()
    except Exception:
        return False
    if not lines or lines[0].strip() != "---":
        return False
    for line in lines[1:]:
        stripped = line.strip()
        if stripped == "---":
            return False
        if stripped.lower() == "type: readme":
            return True
    return False

readmes = []
for path in root.rglob("README.md"):
    if skip(path):
        continue
    if path != root / "README.md" and not has_readme_frontmatter(path):
        continue
    readmes.append(path)

readmes.sort(key=lambda p: (len(p.relative_to(root).parts), str(p.relative_to(root)).lower()))

readme_by_dir = {p.parent: p for p in readmes}

def parent_readme(path: Path):
    d = path.parent.parent
    while True:
        if d in readme_by_dir:
            return readme_by_dir[d]
        if d == root or d.parent == d:
            return None
        d = d.parent

def chain_for(path: Path):
    chain = []
    current = path
    while True:
        parent = parent_readme(current)
        if parent is None:
            break
        chain.append(parent)
        current = parent
    return list(reversed(chain))

tree_path = outdir / "00_readme_tree.md"
pack_path = outdir / "01_readme_pack.md"
chain_path = outdir / "02_readme_chains.tsv"
summary_path = outdir / "03_summary.md"

with summary_path.open("w", encoding="utf-8") as f:
    f.write("# README Inheritance Summary\n\n")
    f.write(f"- generated: {datetime.now().isoformat(timespec='seconds')}\n")
    f.write(f"- root: {root}\n")
    f.write(f"- readme_count: {len(readmes)}\n\n")
    f.write("## Files generated\n\n")
    f.write(f"- `{tree_path}`\n")
    f.write(f"- `{pack_path}`\n")
    f.write(f"- `{chain_path}`\n")

with tree_path.open("w", encoding="utf-8") as f:
    f.write("# README Tree\n\n")
    f.write(f"- root: `{root}`\n")
    f.write(f"- generated: {datetime.now().isoformat(timespec='seconds')}\n\n")

    for path in readmes:
        rel = path.relative_to(root)
        depth = len(rel.parts) - 1
        indent = "  " * depth
        parent = parent_readme(path)
        if parent:
            parent_rel = parent.relative_to(root)
            f.write(f"{indent}- `{rel}` inherits from `{parent_rel}`\n")
        else:
            f.write(f"{indent}- `{rel}` root contract\n")

with chain_path.open("w", encoding="utf-8") as f:
    f.write("readme_path\tparent_readme\tinheritance_chain\n")
    for path in readmes:
        rel = path.relative_to(root)
        parent = parent_readme(path)
        parent_rel = parent.relative_to(root) if parent else ""
        chain = chain_for(path) + [path]
        chain_rel = " -> ".join(str(p.relative_to(root)) for p in chain)
        f.write(f"{rel}\t{parent_rel}\t{chain_rel}\n")

with pack_path.open("w", encoding="utf-8") as f:
    f.write("# README Inheritance Pack\n\n")
    f.write(f"- root: `{root}`\n")
    f.write(f"- generated: {datetime.now().isoformat(timespec='seconds')}\n")
    f.write(f"- readme_count: {len(readmes)}\n\n")
    f.write("This file concatenates README files in inheritance order.\n")
    f.write("Parent README files should be treated as inherited context for nested README files.\n\n")

    for path in readmes:
        rel = path.relative_to(root)
        parent = parent_readme(path)
        parent_rel = parent.relative_to(root) if parent else ""

        f.write("\n---\n\n")
        f.write(f"## FILE: `{rel}`\n\n")
        f.write(f"- directory: `{path.parent.relative_to(root) if path.parent != root else '.'}`\n")
        f.write(f"- parent_readme: `{parent_rel}`\n" if parent_rel else "- parent_readme: none\n")
        f.write(f"- depth: {len(rel.parts) - 1}\n\n")
        f.write("<!-- README_CONTENT_START -->\n\n")

        try:
            content = path.read_text(encoding="utf-8", errors="replace")
        except Exception as e:
            content = f"[could not read file: {e}]"

        f.write(content.rstrip())
        f.write("\n\n<!-- README_CONTENT_END -->\n")

print(f"Wrote: {outdir}")
print(f"Summary: {summary_path}")
print(f"Tree: {tree_path}")
print(f"Pack: {pack_path}")
print(f"Chains: {chain_path}")
PY
