#!/usr/bin/env bash
set -euo pipefail

ROOT="${1:-.}"
OUT="${2:-.llm-context/hub-audit-$(date +%Y%m%d-%H%M%S).md}"

mkdir -p "$(dirname "$OUT")"

{
  echo "# Hub Audit"
  echo
  echo "- root: $ROOT"
  echo "- generated: $(date -Is)"
  echo
  echo "| Decision | Directory | README | AGENTS | dir-metadata | MD here | Subdirs here | Size |"
  echo "| -------- | --------- | ------ | ------ | ------------ | ------- | ------------ | ---- |"

  find "$ROOT" \
    \( -name '.git' -o -name '.obsidian' -o -name '.llm-context' -o -name '.trash' -o -name '__pycache__' -o -name '.pytest_cache' -o -name 'node_modules' -o -name 'site-packages' \) -prune \
    -o -type d -print |
  sort |
  while IFS= read -r d; do
    readme=no
    agents=no
    meta=no
    [[ -f "$d/README.md" ]] && readme=yes
    [[ -f "$d/AGENTS.md" ]] && agents=yes
    [[ -f "$d/dir-metadata.md" ]] && meta=yes

    md="$(find "$d" -maxdepth 1 -type f -iname '*.md' 2>/dev/null | wc -l)"
    sub="$(find "$d" -maxdepth 1 -mindepth 1 -type d 2>/dev/null | wc -l)"
    size="$(du -sh "$d" 2>/dev/null | awk '{print $1}')"

    decision=skip
    if [[ "$readme" == yes || "$agents" == yes || "$meta" == yes ]]; then
      decision=existing
    elif [[ "$sub" -ge 2 || "$md" -ge 3 ]]; then
      decision=candidate
    fi

    printf "| %s | \`%s\` | %s | %s | %s | %s | %s | %s |\n" "$decision" "$d" "$readme" "$agents" "$meta" "$md" "$sub" "$size"
  done
} > "$OUT"

echo "Wrote: $OUT"
