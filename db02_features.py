# db02_features.py
import sqlite3
from pathlib import Path

# ---- Paths ----
BASE_DIR = Path(__file__).parent.resolve()
DB_FILE  = BASE_DIR / "Project" / "project.sqlite3"   # <-- DB in Project/
# If you moved the DB to the repo root, use: DB_FILE = BASE_DIR / "project.sqlite3"

def main():
    if not DB_FILE.exists():
        raise FileNotFoundError(f"Database not found: {DB_FILE}\nRun db01_setup.py first.")

    conn = sqlite3.connect(DB_FILE)
    cur = conn.cursor()
    cur.execute("PRAGMA foreign_keys = ON;")

    # ---- BEFORE snapshots (optional but helpful) ----
    print("\n-- BEFORE --")
    cur.execute("SELECT airline_id, name FROM airlines WHERE airline_id = 'AIRLINE_006';")
    print("AIRLINE_006:", cur.fetchall())
    cur.execute("SELECT crash_id, location FROM crashes WHERE crash_id = 'CRASH_002';")
    print("CRASH_002:", cur.fetchall())
    cur.execute("SELECT COUNT(*) FROM crashes;")
    print("crashes count:", cur.fetchone()[0])

    # ---- Updates ----
    # 1) Fix O'Hare spelling (note doubled quote to escape)
    cur.execute("""
        UPDATE crashes
        SET location = 'Chicago, IL (O''Hare)'
        WHERE crash_id = 'CRASH_002';
    """)

    # 2) Ensure TWA has full name
    cur.execute("""
        UPDATE airlines
        SET name = 'Trans World Airlines'
        WHERE airline_id = 'AIRLINE_006';
    """)

    # ---- Delete ----
    # 3) Example delete: remove CRASH_010
    cur.execute("""
        DELETE FROM crashes
        WHERE crash_id = 'CRASH_010';
    """)

    conn.commit()

    # ---- AFTER snapshots ----
    print("\n-- AFTER --")
    cur.execute("SELECT airline_id, name FROM airlines WHERE airline_id = 'AIRLINE_006';")
    print("AIRLINE_006:", cur.fetchall())
    cur.execute("SELECT crash_id, location FROM crashes WHERE crash_id = 'CRASH_002';")
    print("CRASH_002:", cur.fetchall())
    cur.execute("SELECT COUNT(*) FROM crashes;")
    print("crashes count:", cur.fetchone()[0])
    cur.execute("SELECT crash_id FROM crashes WHERE crash_id = 'CRASH_010';")
    gone = cur.fetchall()
    print("CRASH_010 present?:", gone if gone else "No (deleted)")

    conn.close()
    print(f"\nStep 5 complete — updates/deletes applied to: {DB_FILE}")

if __name__ == "__main__":
    main()