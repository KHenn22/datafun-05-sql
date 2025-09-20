-- Grouping (with aggregates)
-- 1) Group by decade
SELECT
  substr(crash_date, 1, 3) || '0s' AS decade,
  COUNT(*) AS crashes_in_decade,
  SUM(fatalities) AS fatalities_in_decade
FROM crashes
GROUP BY decade
ORDER BY decade;

-- 2) Group by fatalities bucket
SELECT
  CASE
    WHEN fatalities >= 200 THEN 'Catastrophic (200+)'
    WHEN fatalities >= 50  THEN 'Severe (50–199)'
    WHEN fatalities >= 10  THEN 'Moderate (10–49)'
    WHEN fatalities >= 1   THEN 'Low (1–9)'
    ELSE 'None (0)'
  END AS severity_bucket,
  COUNT(*) AS crash_count
FROM crashes
GROUP BY severity_bucket
ORDER BY crash_count DESC;