-- Filtering with WHERE
-- 1) Crashes with 100+ fatalities
SELECT crash_id, flight_no, crash_date, location, fatalities
FROM crashes
WHERE fatalities >= 100
ORDER BY fatalities DESC;

-- 2) Crashes in/after 1990 (compute year on the fly)
SELECT crash_id, flight_no, crash_date, location, fatalities
FROM crashes
WHERE CAST(substr(crash_date, 1, 4) AS INTEGER) >= 1990
ORDER BY crash_date;