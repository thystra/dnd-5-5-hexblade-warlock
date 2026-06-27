#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ID="$(python3 -c 'import json,sys; print(json.load(open(sys.argv[1], encoding="utf-8"))["id"])' "$ROOT/module.json")"
VERSION="$(python3 -c 'import json,sys; print(json.load(open(sys.argv[1], encoding="utf-8"))["version"])' "$ROOT/module.json")"
OUT="${ROOT}/../${ID}-${VERSION}.zip"

cd "$(dirname "$ROOT")"
rm -f "$OUT"
zip -r "$OUT" "$(basename "$ROOT")" \
  -x "*/.git/*" \
  -x "*/.gitignore" \
  -x "*/packs/hexblade-items/*" \
  -x "*.zip"

echo "Created $OUT"
