import sqlite3
from pathlib import Path

BASE_DIR = Path(__file__).parent.resolve()

# ➜ DB lives in Project/
DB_DIR  = BASE_DIR / "Project"
DB_FILE = DB_DIR / "project.sqlite3"

# ➜ SQL files live in Project/sql_create/
SQL_CREATE_DIR = DB_DIR / "sql_create"
DROP_SQL   = SQL_CREATE_DIR / "01_drop_tables.sql"
CREATE_SQL = SQL_CREATE_DIR / "02_create_tables.sql"
INSERT_SQL = SQL_CREATE_DIR / "03_insert_records.sql"

def run_sql(cur, path: Path, required=True):
    if not path.exists():
        raise FileNotFoundError(f"Missing required file: {path}")
    print(f"Running: {path}")
    with path.open("r", encoding="utf-8") as f:
        cur.executescript(f.read())

def main():
    # make sure Project/ exists
    DB_DIR.mkdir(parents=True, exist_ok=True)

    # If a DB file exists in the repo root, move it into Project/ to avoid
    # creating/using a second database at the workspace root.
    root_db = BASE_DIR / "project.sqlite3"
    if root_db.exists():
        if not DB_FILE.exists():
            # move root DB into Project/
            root_db.rename(DB_FILE)
            print(f"Moved existing root DB {root_db} -> {DB_FILE}")
        else:
            # Both exist: prefer the Project DB and remove the root one to avoid confusion
            root_db.unlink()
            print(f"Removed stray root DB {root_db}; using {DB_FILE}")

    # fresh DB
    if DB_FILE.exists():
        DB_FILE.unlink()
        print(f"Deleted old {DB_FILE}")

    conn = sqlite3.connect(DB_FILE)
    cur = conn.cursor()
    cur.execute("PRAGMA foreign_keys = ON;")

    run_sql(cur, DROP_SQL,   required=False)  # safe if missing
    run_sql(cur, CREATE_SQL, required=True)
    run_sql(cur, INSERT_SQL, required=True)

    conn.commit()
    conn.close()
    print(f"Setup complete → {DB_FILE}")

if __name__ == "__main__":
    main()