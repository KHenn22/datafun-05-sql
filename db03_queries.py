import sqlite3
from pathlib import Path

BASE_DIR = Path(__file__).parent.resolve()
DB_FILE  = BASE_DIR / "Project" / "project.sqlite3"
QDIR     = BASE_DIR / "Project" / "sql_queries"

FILES = [
    ("Aggregation", QDIR / "01_query_aggregation.sql"),
    ("Filter",      QDIR / "02_query_filter.sql"),
    ("Sorting",     QDIR / "03_query_sorting.sql"),
    ("Group By",    QDIR / "04_query_group_by.sql"),
    ("Join",        QDIR / "05_query_join.sql"),
]

def run_sql_script(cur, path: Path, section: str):
    if not path.exists():
        raise FileNotFoundError(f"Missing query file: {path}")
    print(f"\n===== {section}: {path.name} =====")
    sql_text = path.read_text(encoding="utf-8")

    # A single file may have multiple SELECTs; execute one by one
    for stmt in [s.strip() for s in sql_text.split(";") if s.strip()]:
        # Skip non-SELECT statements just in case
        if not stmt.lower().startswith("select"):
            continue
        cur.execute(stmt)
        rows = cur.fetchall()
        cols = [d[0] for d in cur.description]
        print("• Query:", stmt.replace("\n", " ")[:120] + ("..." if len(stmt) > 120 else ""))
        print("  Columns:", cols)
        if not rows:
            print("  (no rows)")
        else:
            for r in rows[:10]:
                print("  ", r)
            if len(rows) > 10:
                print(f"  ... ({len(rows)-10} more rows)")

def main():
    if not DB_FILE.exists():
        raise FileNotFoundError(f"Database not found: {DB_FILE}. Run db01_setup.py first.")

    conn = sqlite3.connect(DB_FILE)
    cur = conn.cursor()
    cur.execute("PRAGMA foreign_keys = ON;")

    for section, path in FILES:
        run_sql_script(cur, path, section)

    conn.close()
    print(f"\n[OK] Step 6 queries executed against {DB_FILE}")

if __name__ == "__main__":
    main()