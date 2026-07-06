#!/usr/bin/env bash
set -euo pipefail

ROOT="${1:-.}"
OUT="${2:-.llm-context/symlink-audit-$(date +%Y%m%d-%H%M%S).tsv}"

mkdir -p "$(dirname "$OUT")"

{
  printf "link_path\ttarget\ttarget_exists\n"
  find "$ROOT" -type l -print0 2>/dev/null |
  sort -z |
  while IFS= read -r -d '' link; do
    target="$(readlink "$link")"
    exists=no
    [[ -e "$link" ]] && exists=yes
    printf "%s\t%s\t%s\n" "$link" "$target" "$exists"
  done
} > "$OUT"

echo "Wrote: $OUT"
echo "Count: $(( $(wc -l < "$OUT") - 1 ))"
