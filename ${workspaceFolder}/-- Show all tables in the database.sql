-- List all tables
SELECT name
FROM sqlite_master
WHERE type='table' AND name NOT LIKE 'sqlite_%'
ORDER BY name;

-- Show columns in each table
PRAGMA table_info('airlines');
PRAGMA table_info('crashes');

-- Sample rows
SELECT * FROM airlines LIMIT 10;
SELECT * FROM crashes  LIMIT 10;

-- Row counts (combined into one result set)
SELECT 'airlines' AS table_name, COUNT(*) AS row_count FROM airlines
UNION ALL
SELECT 'crashes'  AS table_name, COUNT(*)              FROM crashes;

-- Check which database file is connected
PRAGMA database_list;