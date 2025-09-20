-- Sorting examples
-- 1) Sort by fatalities (DESC), tie-break by date (ASC)
SELECT crash_id, flight_no, crash_date, location, fatalities
FROM crashes
ORDER BY fatalities DESC, crash_date ASC;

-- 2) Sort airlines by founded_year oldest → newest
SELECT airline_id, name, founded_year, country
FROM airlines
ORDER BY founded_year ASC, name ASC;