-- Join airlines to crashes (report style)
-- 1) All crashes with airline names
SELECT
  c.crash_id,
  c.flight_no,
  c.crash_date,
  c.location,
  c.fatalities,
  a.name AS airline_name,
  a.country AS airline_country
FROM crashes c
JOIN airlines a ON a.airline_id = c.airline_id
ORDER BY c.crash_date;

-- 2) Per-airline summary via JOIN
SELECT
  a.name AS airline_name,
  COUNT(c.crash_id) AS crash_count,
  SUM(c.fatalities) AS total_fatalities,
  ROUND(AVG(c.fatalities), 2) AS avg_fatalities
FROM airlines a
LEFT JOIN crashes c ON c.airline_id = a.airline_id
GROUP BY a.name
ORDER BY total_fatalities DESC, airline_name ASC;