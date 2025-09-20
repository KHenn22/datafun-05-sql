SELECT * FROM airlines;
SELECT * FROM crashes;

-- 00_run_all_step6.sql
-- Run all Step 6 queries in one go (works in SQLite / SQLTools)
PRAGMA foreign_keys = ON;

-- =========================
-- 1) Aggregation examples
-- =========================
SELECT '== Aggregation: crashes per airline ==' AS section;
SELECT a.airline_id,
       a.name,
       COUNT(*) AS crash_count
FROM airlines a
JOIN crashes  c ON c.airline_id = a.airline_id
GROUP BY a.airline_id, a.name
ORDER BY crash_count DESC, a.name;

SELECT '== Aggregation: overall stats ==' AS section;
SELECT COUNT(*)                        AS total_crashes,
       COUNT(DISTINCT airline_id)      AS airlines_involved,
       MIN(year)                       AS earliest_year,
       MAX(year)                       AS latest_year
FROM crashes;

-- =========================
-- 2) WHERE filter examples
-- =========================
SELECT '== Filter: ocean-related locations ==' AS section;
SELECT crash_id, flight_no, location, year, airline_id
FROM crashes
WHERE location LIKE '%Ocean%'
   OR location LIKE '%Atlantic%'
ORDER BY year;

SELECT '== Filter: crashes in/after 1980 ==' AS section;
SELECT crash_id, flight_no, location, year
FROM crashes
WHERE year >= 1980
ORDER BY year, crash_id;

-- =========================
-- 3) ORDER BY examples
-- =========================
SELECT '== Sorting: newest to oldest ==' AS section;
SELECT crash_id, flight_no, location, year
FROM crashes
ORDER BY year DESC, crash_id;

SELECT '== Sorting: by airline name, then year ==' AS section;
SELECT a.name AS airline, c.crash_id, c.flight_no, c.location, c.year
FROM crashes c
JOIN airlines a ON a.airline_id = c.airline_id
ORDER BY a.name, c.year, c.crash_id;

-- =========================
-- 4) GROUP BY examples
-- =========================
SELECT '== Group By: crashes per decade ==' AS section;
SELECT (year/10)*10 AS decade,
       COUNT(*)     AS crashes_in_decade
FROM crashes
GROUP BY (year/10)*10
ORDER BY decade;

SELECT '== Group By: crashes by airline country ==' AS section;
SELECT a.country,
       COUNT(*) AS crashes
FROM crashes c
JOIN airlines a ON a.airline_id = c.airline_id
GROUP BY a.country
ORDER BY crashes DESC, a.country;

-- =========================
-- 5) JOIN examples
-- =========================
SELECT '== Join: crashes with airline details ==' AS section;
SELECT c.crash_id,
       c.flight_no,
       c.year,
       a.name   AS airline,
       a.country,
       c.location
FROM crashes c
JOIN airlines a ON a.airline_id = c.airline_id
ORDER BY c.year DESC, c.crash_id;

SELECT '== Join + Having: airlines with 2+ crashes ==' AS section;
SELECT a.name,
       COUNT(*) AS crash_count
FROM airlines a
JOIN crashes  c ON c.airline_id = a.airline_id
GROUP BY a.airline_id, a.name
HAVING COUNT(*) >= 2
ORDER BY crash_count DESC, a.name;