#!/usr/bin/env bash
# Export Zotero "UD Turkic" collection to references.bib for this paper.
# Usage: ./bib-export.sh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUT="$SCRIPT_DIR/references.bib"
COLLECTION="UD Turkic"

echo "Exporting '$COLLECTION' → $OUT"
bib export "$COLLECTION" -f bibtex -o "$OUT"
echo "Done: $OUT ($(wc -l < "$OUT") lines)"
