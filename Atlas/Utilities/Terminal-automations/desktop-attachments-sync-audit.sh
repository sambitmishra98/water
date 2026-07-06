#!/usr/bin/env bash
set -euo pipefail

VAULT_ROOT="${1:-.}"
DESKTOP_ROOT="${2:-$HOME/Desktop}"
OUTDIR="${3:-.llm-context/desktop-attachments-sync-audit-$(date +%Y%m%d-%H%M%S)}"

mkdir -p "$OUTDIR"

SUMMARY="$OUTDIR/00_summary.md"
SYNC="$OUTDIR/01_obsidian_sync_and_attachment_settings.md"
DESKTOP="$OUTDIR/02_desktop_audit.md"
ATTACH="$OUTDIR/03_attachments_audit.md"
ATTACH_EXT="$OUTDIR/04_attachments_extensions.tsv"
ATTACH_TOP="$OUTDIR/05_attachments_top_files.txt"
ATTACH_RECENT="$OUTDIR/06_attachments_recent_files.txt"
ATTACH_ORPHANS="$OUTDIR/07_attachment_reference_audit.tsv"
DESKTOP_TOP="$OUTDIR/08_desktop_top_files.txt"
DESKTOP_RECENT="$OUTDIR/09_desktop_recent_files.txt"
SENSITIVE="$OUTDIR/10_sensitive_path_flags.txt"

real_vault="$(realpath "$VAULT_ROOT")"

{
  echo "# Desktop, Attachments, and Sync Audit"
  echo
  echo "- generated: $(date -Is)"
  echo "- vault_root: $real_vault"
  echo "- desktop_root: $DESKTOP_ROOT"
  echo
  echo "## Main checks"
  echo
  echo "| Path | Exists | Size | Dirs | Files | Symlinks |"
  echo "| ---- | ------ | ---- | ---- | ----- | -------- |"

  for p in "$VAULT_ROOT/.obsidian" "$VAULT_ROOT/Attachments" "$VAULT_ROOT/Supplementary" "$DESKTOP_ROOT"; do
    if [[ -e "$p" ]]; then
      size="$(du -sh "$p" 2>/dev/null | awk '{print $1}')"
      dirs="$(find "$p" -type d 2>/dev/null | wc -l)"
      files="$(find "$p" -type f 2>/dev/null | wc -l)"
      links="$(find "$p" -type l 2>/dev/null | wc -l)"
      printf "| %s | yes | %s | %s | %s | %s |\n" "$p" "$size" "$dirs" "$files" "$links"
    else
      printf "| %s | no |  |  |  |  |\n" "$p"
    fi
  done
} > "$SUMMARY"

{
  echo "# Obsidian Sync and Attachment Settings"
  echo
  echo "## Relevant .obsidian files"
  echo
  find "$VAULT_ROOT/.obsidian" -maxdepth 2 -type f 2>/dev/null | sort | sed 's/^/- /'
  echo
  echo "## Recently modified .obsidian files"
  echo
  find "$VAULT_ROOT/.obsidian" -maxdepth 3 -type f -printf '%TY-%Tm-%Td %TH:%TM\t%p\n' 2>/dev/null | sort -r | head -n 80
  echo
  echo "## Parsed safe settings"
  echo
  python3 - "$VAULT_ROOT" <<'PY'
import json, sys
from pathlib import Path

root = Path(sys.argv[1])
paths = [
    root / ".obsidian" / "app.json",
    root / ".obsidian" / "appearance.json",
    root / ".obsidian" / "sync.json",
    root / ".obsidian" / "core-plugins.json",
    root / ".obsidian" / "community-plugins.json",
]

interesting = (
    "attachment", "sync", "excluded", "exclude", "ignore", "folder",
    "newFileLocation", "newLinkFormat", "useMarkdownLinks"
)

def safe_value(v):
    if isinstance(v, (bool, int, float)) or v is None:
        return v
    if isinstance(v, str):
        if len(v) > 120:
            return v[:120] + "...[truncated]"
        return v
    if isinstance(v, list):
        return f"[list length {len(v)}]"
    if isinstance(v, dict):
        return f"[dict keys {len(v)}]"
    return type(v).__name__

for path in paths:
    print(f"\n### {path.relative_to(root) if path.exists() else path}")
    if not path.exists():
        print("missing")
        continue
    try:
        data = json.loads(path.read_text(errors="replace"))
    except Exception as e:
        print(f"could not parse json: {e}")
        continue

    if isinstance(data, dict):
        found = False
        for k, v in sorted(data.items()):
            if any(term.lower() in k.lower() for term in interesting):
                print(f"- {k}: {safe_value(v)}")
                found = True
        if not found:
            print("- no obvious attachment/sync/exclusion keys found")
    elif isinstance(data, list):
        print(f"- list length: {len(data)}")
        for item in data[:80]:
            print(f"  - {item}")
    else:
        print(f"- type: {type(data).__name__}")
PY
} > "$SYNC"

{
  echo "# Desktop Audit"
  echo
  if [[ ! -d "$DESKTOP_ROOT" ]]; then
    echo "Desktop path missing: $DESKTOP_ROOT"
  else
    echo "- path: $DESKTOP_ROOT"
    echo "- size: $(du -sh "$DESKTOP_ROOT" 2>/dev/null | awk '{print $1}')"
    echo "- dirs: $(find "$DESKTOP_ROOT" -type d 2>/dev/null | wc -l)"
    echo "- files: $(find "$DESKTOP_ROOT" -type f 2>/dev/null | wc -l)"
    echo
    echo "## Immediate children"
    echo
    echo "| Path | Size | Dirs | Files |"
    echo "| ---- | ---- | ---- | ----- |"
    find "$DESKTOP_ROOT" -mindepth 1 -maxdepth 1 -print0 2>/dev/null |
    sort -z |
    while IFS= read -r -d '' p; do
      size="$(du -sh "$p" 2>/dev/null | awk '{print $1}')"
      dirs="$(find "$p" -type d 2>/dev/null | wc -l)"
      files="$(find "$p" -type f 2>/dev/null | wc -l)"
      printf "| %s | %s | %s | %s |\n" "$p" "$size" "$dirs" "$files"
    done
  fi
} > "$DESKTOP"

if [[ -d "$DESKTOP_ROOT" ]]; then
  du -ah "$DESKTOP_ROOT" 2>/dev/null | sort -hr | head -n 200 > "$DESKTOP_TOP"
  find "$DESKTOP_ROOT" -type f -printf '%TY-%Tm-%Td %TH:%TM\t%s\t%p\n' 2>/dev/null | sort -r | head -n 200 > "$DESKTOP_RECENT"
else
  : > "$DESKTOP_TOP"
  : > "$DESKTOP_RECENT"
fi

{
  echo "# Attachments Audit"
  echo
  if [[ ! -d "$VAULT_ROOT/Attachments" ]]; then
    echo "Attachments directory missing."
  else
    echo "- path: $VAULT_ROOT/Attachments"
    echo "- size: $(du -sh "$VAULT_ROOT/Attachments" 2>/dev/null | awk '{print $1}')"
    echo "- dirs: $(find "$VAULT_ROOT/Attachments" -type d 2>/dev/null | wc -l)"
    echo "- files: $(find "$VAULT_ROOT/Attachments" -type f 2>/dev/null | wc -l)"
    echo "- symlinks: $(find "$VAULT_ROOT/Attachments" -type l 2>/dev/null | wc -l)"
    echo
    echo "## Immediate children"
    echo
    echo "| Path | Size | Dirs | Files |"
    echo "| ---- | ---- | ---- | ----- |"
    find "$VAULT_ROOT/Attachments" -mindepth 1 -maxdepth 1 -print0 2>/dev/null |
    sort -z |
    while IFS= read -r -d '' p; do
      size="$(du -sh "$p" 2>/dev/null | awk '{print $1}')"
      dirs="$(find "$p" -type d 2>/dev/null | wc -l)"
      files="$(find "$p" -type f 2>/dev/null | wc -l)"
      printf "| %s | %s | %s | %s |\n" "$p" "$size" "$dirs" "$files"
    done
  fi
} > "$ATTACH"

if [[ -d "$VAULT_ROOT/Attachments" ]]; then
  find "$VAULT_ROOT/Attachments" -type f 2>/dev/null |
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
  ' | sort -k2,2nr > "$ATTACH_EXT"

  du -ah "$VAULT_ROOT/Attachments" 2>/dev/null | sort -hr | head -n 200 > "$ATTACH_TOP"

  find "$VAULT_ROOT/Attachments" -type f -printf '%TY-%Tm-%Td %TH:%TM\t%s\t%p\n' 2>/dev/null |
  sort -r |
  head -n 300 > "$ATTACH_RECENT"
else
  : > "$ATTACH_EXT"
  : > "$ATTACH_TOP"
  : > "$ATTACH_RECENT"
fi

python3 - "$VAULT_ROOT" "$ATTACH_ORPHANS" <<'PY'
import sys
from pathlib import Path
from urllib.parse import quote

root = Path(sys.argv[1]).resolve()
out = Path(sys.argv[2])
attachments = root / "Attachments"

skip_parts = {
    ".obsidian", ".llm-context", ".git", ".trash",
    "Supplementary", "node_modules", "__pycache__"
}

md_files = []
for p in root.rglob("*.md"):
    if any(part in skip_parts for part in p.parts):
        continue
    md_files.append(p)

texts = []
for p in md_files:
    try:
        texts.append((p, p.read_text(errors="replace")))
    except Exception:
        pass

rows = ["attachment_path\tbytes\textension\treferenced\treference_count\texample_note"]

if attachments.exists():
    for f in sorted(attachments.rglob("*")):
        if not f.is_file():
            continue
        name = f.name
        encoded = quote(name)
        rel = str(f.relative_to(root))
        rel_encoded = quote(rel)
        needles = {name, encoded, rel, rel_encoded}
        refs = []
        for p, text in texts:
            if any(n in text for n in needles):
                refs.append(str(p.relative_to(root)))
        ext = f.suffix.lower().lstrip(".") or "[no extension]"
        try:
            size = f.stat().st_size
        except Exception:
            size = 0
        rows.append(
            f"{rel}\t{size}\t{ext}\t{str(bool(refs)).lower()}\t{len(refs)}\t{refs[0] if refs else ''}"
        )

out.write_text("\n".join(rows) + "\n")
PY

{
  echo "# Sensitive Path Flags"
  echo
  echo "## Desktop"
  find "$DESKTOP_ROOT" 2>/dev/null | grep -Ei 'passport|visa|i-20|tax|health|medical|aadhaar|ssn|photoid|lease|bank|insurance|whatsapp|facebook|chat|message|recording|private|bipasa|relationship|breakup|shadow|receipt|reimbursement' || true
  echo
  echo "## Attachments"
  find "$VAULT_ROOT/Attachments" 2>/dev/null | grep -Ei 'passport|visa|i-20|tax|health|medical|aadhaar|ssn|photoid|lease|bank|insurance|whatsapp|facebook|chat|message|recording|private|bipasa|relationship|breakup|shadow|receipt|reimbursement' || true
} > "$SENSITIVE"

tar -czf "$OUTDIR.tar.gz" -C "$OUTDIR" .

echo "Wrote audit directory: $OUTDIR"
echo "Wrote bundle: $OUTDIR.tar.gz"
echo
echo "Paste these first:"
echo "cat $SUMMARY"
echo "cat $SYNC"
echo "cat $ATTACH"
echo "cat $ATTACH_EXT"
echo "head -n 80 $ATTACH_ORPHANS"
echo "head -n 120 $SENSITIVE"
