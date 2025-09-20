PRAGMA foreign_keys = ON;

-- Normalize O'Hare spelling for CRASH_002
UPDATE crashes
SET location = 'Chicago, IL (O''Hare)'
WHERE crash_id = 'CRASH_002';

-- Ensure full airline name for TWA
UPDATE airlines
SET name = 'Trans World Airlines'
WHERE airline_id = 'AIRLINE_006';