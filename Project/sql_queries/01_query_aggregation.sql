-- Aggregations: COUNT, SUM, AVG, MIN, MAX
-- 1) Overall stats across all crashes
SELECT
  COUNT(*)                    AS total_crashes,
  SUM(fatalities)             AS total_fatalities,
  ROUND(AVG(fatalities), 2)   AS avg_fatalities,
  MIN(crash_date)             AS first_crash_date,
  MAX(crash_date)             AS last_crash_date
FROM crashes;

-- 2) Airline with highest fatalities (top 3)
SELECT
  a.airline_id,
  a.name  AS airline_name,
  SUM(c.fatalities) AS airline_total_fatalities
FROM airlines a
JOIN crashes c ON c.airline_id = a.airline_id
GROUP BY a.airline_id, a.name
ORDER BY airline_total_fatalities DESC
LIMIT 3;