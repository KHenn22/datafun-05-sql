#!/usr/bin/env bash
# Open the project's SQLite DB located in Project/project.sqlite3
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
DB_PATH="$ROOT_DIR/Project/project.sqlite3"

# If the DB doesn't exist, run the setup script to create it
if [ ! -f "$DB_PATH" ]; then
  echo "Database not found at $DB_PATH — running db01_setup.py to create it..."
  python3 "$ROOT_DIR/db01_setup.py"
fi

# Open sqlite3 against the Project DB
sqlite3 "$DB_PATH"
