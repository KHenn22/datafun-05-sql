PRAGMA foreign_keys = ON;

-- Example delete (pick any row you want to demonstrate)
-- Here we remove the DL1141 record added as CRASH_010.
DELETE FROM crashes
WHERE crash_id = 'CRASH_010' AND flight_no = 'DL1141';