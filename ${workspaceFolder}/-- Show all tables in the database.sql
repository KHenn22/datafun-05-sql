-- Show all tables in the database
SELECT name 
FROM sqlite_master 
WHERE type='table' AND name NOT LIKE 'sqlite_%';

-- See the columns in Airlines
PRAGMA table_info('Airlines');

-- See the columns in Crashes
PRAGMA table_info('Crashes');

-- Peek at some rows
SELECT * FROM Airlines LIMIT 10;
SELECT * FROM Crashes LIMIT 10;

-- Row counts
SELECT 'Airlines' AS table_name, COUNT(*) AS row_count FROM Airlines;
SELECT 'Crashes'  AS table_name, COUNT(*) AS row_count FROM Crashes;