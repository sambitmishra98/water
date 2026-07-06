#!/usr/bin/env bash
set -euo pipefail

ROOT="${1:-.}"
OUTDIR="${2:-.llm-context/agents-inheritance-$(date +%Y%m%d-%H%M%S)}"

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

def has_agent_frontmatter(path: Path) -> bool:
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
        if stripped.lower() == "type: agent-guide":
            return True
    return False

agents = []
for path in root.rglob("AGENTS.md"):
    if skip(path):
        continue
    if path != root / "AGENTS.md" and not has_agent_frontmatter(path):
        continue
    agents.append(path)

agents.sort(key=lambda p: (len(p.relative_to(root).parts), str(p.relative_to(root)).lower()))

agent_by_dir = {p.parent: p for p in agents}

def parent_agent(path: Path):
    d = path.parent.parent
    while True:
        if d in agent_by_dir:
            return agent_by_dir[d]
        if d == root or d.parent == d:
            return None
        d = d.parent

def chain_for(path: Path):
    chain = []
    current = path
    while True:
        parent = parent_agent(current)
        if parent is None:
            break
        chain.append(parent)
        current = parent
    return list(reversed(chain))

tree_path = outdir / "00_agents_tree.md"
pack_path = outdir / "01_agents_pack.md"
chain_path = outdir / "02_agents_chains.tsv"
summary_path = outdir / "03_summary.md"

with summary_path.open("w", encoding="utf-8") as f:
    f.write("# AGENTS Inheritance Summary\n\n")
    f.write(f"- generated: {datetime.now().isoformat(timespec='seconds')}\n")
    f.write(f"- root: {root}\n")
    f.write(f"- agents_count: {len(agents)}\n\n")
    f.write("## Files generated\n\n")
    f.write(f"- `{tree_path}`\n")
    f.write(f"- `{pack_path}`\n")
    f.write(f"- `{chain_path}`\n")

with tree_path.open("w", encoding="utf-8") as f:
    f.write("# AGENTS Tree\n\n")
    f.write(f"- root: `{root}`\n")
    f.write(f"- generated: {datetime.now().isoformat(timespec='seconds')}\n\n")

    for path in agents:
        rel = path.relative_to(root)
        depth = len(rel.parts) - 1
        indent = "  " * depth
        parent = parent_agent(path)
        if parent:
            parent_rel = parent.relative_to(root)
            f.write(f"{indent}- `{rel}` inherits from `{parent_rel}`\n")
        else:
            f.write(f"{indent}- `{rel}` root contract\n")

with chain_path.open("w", encoding="utf-8") as f:
    f.write("agents_path\tparent_agents\tinheritance_chain\n")
    for path in agents:
        rel = path.relative_to(root)
        parent = parent_agent(path)
        parent_rel = parent.relative_to(root) if parent else ""
        chain = chain_for(path) + [path]
        chain_rel = " -> ".join(str(p.relative_to(root)) for p in chain)
        f.write(f"{rel}\t{parent_rel}\t{chain_rel}\n")

with pack_path.open("w", encoding="utf-8") as f:
    f.write("# AGENTS Inheritance Pack\n\n")
    f.write(f"- root: `{root}`\n")
    f.write(f"- generated: {datetime.now().isoformat(timespec='seconds')}\n")
    f.write(f"- agents_count: {len(agents)}\n\n")
    f.write("This file concatenates AGENTS files in inheritance order.\n")
    f.write("Parent AGENTS files should be treated as inherited behavior for nested AGENTS files.\n\n")

    for path in agents:
        rel = path.relative_to(root)
        parent = parent_agent(path)
        parent_rel = parent.relative_to(root) if parent else ""

        f.write("\n---\n\n")
        f.write(f"## FILE: `{rel}`\n\n")
        f.write(f"- directory: `{path.parent.relative_to(root) if path.parent != root else '.'}`\n")
        f.write(f"- parent_agents: `{parent_rel}`\n" if parent_rel else "- parent_agents: none\n")
        f.write(f"- depth: {len(rel.parts) - 1}\n\n")
        f.write("<!-- AGENTS_CONTENT_START -->\n\n")

        try:
            content = path.read_text(encoding="utf-8", errors="replace")
        except Exception as e:
            content = f"[could not read file: {e}]"

        f.write(content.rstrip())
        f.write("\n\n<!-- AGENTS_CONTENT_END -->\n")

print(f"Wrote: {outdir}")
print(f"Summary: {summary_path}")
print(f"Tree: {tree_path}")
print(f"Pack: {pack_path}")
print(f"Chains: {chain_path}")
PY
