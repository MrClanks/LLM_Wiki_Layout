#!/usr/bin/env bash
set -euo pipefail

ROOT="$(pwd)"

mkdir -p \
  "$ROOT/raw" \
  "$ROOT/wiki/.obsidian" \
  "$ROOT/wiki/concepts" \
  "$ROOT/wiki/dashboard" \
  "$ROOT/wiki/entities" \
  "$ROOT/wiki/examples" \
  "$ROOT/wiki/notes" \
  "$ROOT/wiki/sources"

touch \
  "$ROOT/wiki/index.md" \
  "$ROOT/wiki/log.md" \
  "$ROOT/Schema.md"

echo "Project structure created successfully."

#chmod +x create_structure.sh
#./create_structure.sh