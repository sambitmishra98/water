#!/usr/bin/env bash
set -euo pipefail

ROOT="${1:-.}"
BASE=".llm-context/standard-audits/$(basename "$(realpath "$ROOT")")-$(date +%Y%m%d-%H%M%S)"

mkdir -p "$BASE"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

bash "$SCRIPT_DIR/folder-audit.sh" "$ROOT" "$BASE/folder"
bash "$SCRIPT_DIR/hub-audit.sh" "$ROOT" "$BASE/hub-audit.md"
bash "$SCRIPT_DIR/sensitive-path-audit.sh" "$ROOT" "$BASE/sensitive-paths.txt"
bash "$SCRIPT_DIR/symlink-audit.sh" "$ROOT" "$BASE/symlinks.tsv"
bash "$SCRIPT_DIR/markdown-style-audit.sh" "$ROOT" "$BASE/markdown-style.tsv"

tar -czf "$BASE.tar.gz" -C "$BASE" .

echo "Wrote audit directory: $BASE"
echo "Wrote bundle: $BASE.tar.gz"
echo
echo "Read first:"
echo "cat $BASE/folder/summary.md"
