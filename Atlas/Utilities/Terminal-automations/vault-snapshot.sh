#!/usr/bin/env bash
# Hard-linked rsync snapshots of this vault.
#
# Usage: vault-snapshot.sh [dest-root] [--keep N]
#   dest-root defaults to $VAULT_SNAPSHOT_DIR, else $HOME/vault-snapshots/<vault-name>
#   --keep N  prune to the newest N snapshots (default 30)
#
# Unchanged files are hard-linked against the previous snapshot, so
# incremental snapshots cost seconds and little disk. Restore = copy the file
# back from <dest-root>/<stamp>/.
#
# Note: unlike the audit scripts in this directory, this script WRITES —
# but only outside the vault, to the snapshot destination. It never modifies
# vault content.
set -euo pipefail

VAULT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"
VAULT_NAME="$(basename "$VAULT")"

KEEP=30
DEST_ROOT="${VAULT_SNAPSHOT_DIR:-$HOME/vault-snapshots/$VAULT_NAME}"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --keep) KEEP="$2"; shift 2 ;;
    *) DEST_ROOT="$1"; shift ;;
  esac
done

STAMP="$(date +%Y%m%d-%H%M%S)"
DEST="$DEST_ROOT/$STAMP"
mkdir -p "$DEST_ROOT"

PREV="$(ls -1d "$DEST_ROOT"/*/ 2>/dev/null | sort | tail -1 || true)"

LINKDEST=()
if [[ -n "$PREV" ]]; then
  LINKDEST=(--link-dest="$PREV")
fi

rsync -a --delete \
  --exclude='/.git' \
  --exclude='/Supplementary' \
  --exclude='/.trash' \
  --exclude='/.llm-context' \
  --exclude='/.obsidian/workspace*' \
  "${LINKDEST[@]}" \
  "$VAULT/" "$DEST/"

echo "snapshot: $DEST"

# prune to newest $KEEP
COUNT=$(ls -1d "$DEST_ROOT"/*/ 2>/dev/null | wc -l)
if (( COUNT > KEEP )); then
  ls -1d "$DEST_ROOT"/*/ | sort | head -n $((COUNT - KEEP)) | xargs rm -rf
  echo "pruned to newest $KEEP snapshots"
fi
