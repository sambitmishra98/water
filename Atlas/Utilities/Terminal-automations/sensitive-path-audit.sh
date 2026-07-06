#!/usr/bin/env bash
set -euo pipefail

ROOT="${1:-.}"
OUT="${2:-.llm-context/sensitive-path-audit-$(date +%Y%m%d-%H%M%S).txt}"

mkdir -p "$(dirname "$OUT")"

find "$ROOT" 2>/dev/null |
grep -Ei 'aadhaar|passport|visa|i-20|tax|health|medical|photoid|ssn|bank|lease|insurance|whatsapp|facebook|chat|message|recording|bipasa|private|breakup|relationship|shadow|therapy|doctor|receipt|reimbursement' |
sort > "$OUT" || true

echo "Wrote: $OUT"
echo "Count: $(wc -l < "$OUT")"
