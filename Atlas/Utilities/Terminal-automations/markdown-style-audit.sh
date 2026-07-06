#!/usr/bin/env bash
set -euo pipefail

ROOT="${1:-.}"
OUT="${2:-.llm-context/markdown-style-audit-$(date +%Y%m%d-%H%M%S).tsv}"

mkdir -p "$(dirname "$OUT")"

{
  printf "file\thas_frontmatter\tfirst_heading\tinline_single_hash_tags\n"
  find "$ROOT" -type f -iname '*.md' \
    -not -path '*/.obsidian/*' \
    -not -path '*/.llm-context/*' \
    -print0 2>/dev/null |
  sort -z |
  while IFS= read -r -d '' f; do
    has_fm=no
    head -n 1 "$f" | grep -qx -- '---' && has_fm=yes

    first_heading="$(grep -m1 -E '^#{1,6} ' "$f" || true)"
    [[ -z "$first_heading" ]] && first_heading='[none]'

    tag_count="$(grep -Eoh '(^|[[:space:]])#[A-Za-z0-9_/-]+' "$f" 2>/dev/null | wc -l)"

    printf "%s\t%s\t%s\t%s\n" "$f" "$has_fm" "$first_heading" "$tag_count"
  done
} > "$OUT"

echo "Wrote: $OUT"
