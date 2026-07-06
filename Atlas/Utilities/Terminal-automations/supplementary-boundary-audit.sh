#!/usr/bin/env bash
set -euo pipefail

ROOT="${1:-Supplementary}"
OUT="${2:-.llm-context/supplementary-boundary-audit-$(date +%Y%m%d-%H%M%S).md}"

mkdir -p "$(dirname "$OUT")"

{
  echo "# Supplementary Boundary Audit"
  echo
  echo "- root: $ROOT"
  echo "- generated: $(date -Is)"
  echo
  echo "## Expected top-level directories"
  echo
  echo "- $ROOT/in-sync"
  echo "- $ROOT/on-drive"
  echo
  echo "## Actual top-level directories"
  echo
  echo "| Status | Path | Size | Files |"
  echo "| ------ | ---- | ---- | ----- |"

  find "$ROOT" -mindepth 1 -maxdepth 1 -type d -print0 2>/dev/null |
  sort -z |
  while IFS= read -r -d '' d; do
    base="$(basename "$d")"
    status="unexpected"
    [[ "$base" == "in-sync" || "$base" == "on-drive" ]] && status="expected"
    size="$(du -sh "$d" 2>/dev/null | awk '{print $1}')"
    files="$(find "$d" -type f 2>/dev/null | wc -l)"
    printf "| %s | \`%s\` | %s | %s |\n" "$status" "$d" "$size" "$files"
  done

  echo
  echo "## Empty unexpected directories"
  echo
  find "$ROOT" -mindepth 1 -maxdepth 1 -type d 2>/dev/null |
  while IFS= read -r d; do
    base="$(basename "$d")"
    [[ "$base" == "in-sync" || "$base" == "on-drive" ]] && continue
    files="$(find "$d" -type f 2>/dev/null | wc -l)"
    if [[ "$files" -eq 0 ]]; then
      echo "- $d"
    fi
  done
} > "$OUT"

echo "Wrote: $OUT"
cat "$OUT"
