-- Count rows in each table
SELECT COUNT(*) AS airline_count FROM airlines;
SELECT COUNT(*) AS crash_count FROM crashes;

-- Show all airlines
SELECT * FROM airlines;

-- Show all crashes joined with airline names
SELECT c.crash_id, c.flight_no, c.crash_date, c.location, c.fatalities, a.name AS airline_name
FROM crashes c
JOIN airlines a ON c.airline_id = a.airline_id;

-- Top 3 deadliest crashes
SELECT c.crash_id, c.flight_no, c.fatalities, a.name AS airline_name
FROM crashes c
JOIN airlines a ON c.airline_id = a.airline_id
ORDER BY c.fatalities DESC
LIMIT 3;