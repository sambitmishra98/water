#!/usr/bin/env bash
set -euo pipefail

if [[ "$#" -lt 1 ]]; then
  echo "Usage: $0 PATH [PATH ...]"
  exit 2
fi

OUTDIR=".llm-context/context-packs"
mkdir -p "$OUTDIR"

STAMP="$(date +%Y%m%d-%H%M%S)"
OUT="$OUTDIR/context-pack-$STAMP.tar.gz"
MANIFEST="$OUTDIR/context-pack-$STAMP-manifest.txt"

{
  echo "# Context Pack Manifest"
  echo
  echo "- generated: $(date -Is)"
  echo "- output: $OUT"
  echo
  echo "## Included roots"
  for p in "$@"; do
    echo "- $p"
  done
} > "$MANIFEST"

tar \
  --exclude='.git' \
  --exclude='.obsidian' \
  --exclude='.llm-context' \
  --exclude='.trash' \
  --exclude='node_modules' \
  --exclude='__pycache__' \
  --exclude='.pytest_cache' \
  --exclude='*.pyfrs' \
  --exclude='*.pyfrm' \
  --exclude='*.vtu' \
  --exclude='*.msh' \
  --exclude='*.mp4' \
  --exclude='*.mov' \
  --exclude='*.jpg' \
  --exclude='*.jpeg' \
  --exclude='*.png' \
  --exclude='*.heic' \
  -czf "$OUT" "$@"

echo "Wrote: $OUT"
echo "Manifest: $MANIFEST"
