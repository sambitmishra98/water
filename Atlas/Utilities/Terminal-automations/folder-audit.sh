#!/usr/bin/env bash
set -euo pipefail

ROOT="${1:-.}"
NAME="$(basename "$(realpath "$ROOT")")"
OUTDIR="${2:-.llm-context/audits/${NAME}-$(date +%Y%m%d-%H%M%S)}"

mkdir -p "$OUTDIR"

SUMMARY="$OUTDIR/summary.md"
TREE="$OUTDIR/tree-depth4.txt"
DIRS="$OUTDIR/directories-depth4.tsv"
TOP="$OUTDIR/top-sizes.txt"
EXT="$OUTDIR/extensions.tsv"

{
  echo "# Folder Audit"
  echo
  echo "- root: $ROOT"
  echo "- absolute_path: $(realpath "$ROOT")"
  echo "- generated: $(date -Is)"
  echo "- size: $(du -sh "$ROOT" 2>/dev/null | awk '{print $1}')"
  echo "- dirs: $(find "$ROOT" -type d 2>/dev/null | wc -l)"
  echo "- files: $(find "$ROOT" -type f 2>/dev/null | wc -l)"
  echo "- markdown: $(find "$ROOT" -type f -iname '*.md' 2>/dev/null | wc -l)"
  echo "- symlinks: $(find "$ROOT" -type l 2>/dev/null | wc -l)"
  echo
  echo "## Immediate children"
  echo
  echo "| Path | Size | Dirs | Files |"
  echo "| ---- | ---- | ---- | ----- |"
  find "$ROOT" -mindepth 1 -maxdepth 1 -type d -print0 2>/dev/null |
  sort -z |
  while IFS= read -r -d '' d; do
    size="$(du -sh "$d" 2>/dev/null | awk '{print $1}')"
    dirs="$(find "$d" -type d 2>/dev/null | wc -l)"
    files="$(find "$d" -type f 2>/dev/null | wc -l)"
    printf "| %s | %s | %s | %s |\n" "$d" "$size" "$dirs" "$files"
  done
} > "$SUMMARY"

find "$ROOT" -maxdepth 4 -type d 2>/dev/null | sort > "$TREE"

{
  printf "path\tdepth\tsize\tfiles_here\tdirs_here\tmd_here\n"
  find "$ROOT" -maxdepth 4 -type d -print0 2>/dev/null |
  sort -z |
  while IFS= read -r -d '' d; do
    rel="${d#"$ROOT"}"
    depth="$(awk -F/ '{print NF-1}' <<< "$rel")"
    size="$(du -sh "$d" 2>/dev/null | awk '{print $1}')"
    files="$(find "$d" -maxdepth 1 -type f 2>/dev/null | wc -l)"
    dirs="$(find "$d" -maxdepth 1 -mindepth 1 -type d 2>/dev/null | wc -l)"
    md="$(find "$d" -maxdepth 1 -type f -iname '*.md' 2>/dev/null | wc -l)"
    printf "%s\t%s\t%s\t%s\t%s\t%s\n" "$d" "$depth" "$size" "$files" "$dirs" "$md"
  done
} > "$DIRS"

du -ah "$ROOT" 2>/dev/null | sort -hr | head -n 200 > "$TOP"

find "$ROOT" -type f 2>/dev/null |
awk '
{
  n=$0
  sub(/^.*\//,"",n)
  if (n !~ /\./) ext="[no extension]"
  else {
    ext=tolower(n)
    sub(/^.*\./,"",ext)
  }
  count[ext]++
}
END {
  print "extension\tcount"
  for (e in count) print e "\t" count[e]
}
' | sort -k2,2nr > "$EXT"

echo "Wrote: $OUTDIR"
echo "Read first: $SUMMARY"
