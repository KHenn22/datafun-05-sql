-- Insert records into the airlines table first
INSERT INTO airlines (airline_id, name, founded_year, country) VALUES
('AIRLINE_001', 'American Airlines', 1930, 'USA'),
('AIRLINE_002', 'Delta Air Lines',   1924, 'USA'),
('AIRLINE_003', 'United Airlines',   1926, 'USA'),
('AIRLINE_004', 'Lufthansa',         1953, 'Germany'),
('AIRLINE_005', 'Air France',        1933, 'France');

-- Insert records into the crashes table
-- And include foreign key references to the airlines table
-- IMPORTANT: No tic marks inside a string; use two single quotes to escape a single quote
INSERT INTO crashes (crash_id, flight_no, crash_date, location, fatalities, airline_id) VALUES
('CRASH_001', 'AA587', '2001-11-12', 'Queens, NY',                         265, 'AIRLINE_001'),
('CRASH_002', 'AA191', '1979-05-25', 'Chicago, IL (O''Hare)',              273, 'AIRLINE_001'),

('CRASH_003', 'DL191', '1985-08-02', 'Dallas, TX',                         137, 'AIRLINE_002'),
('CRASH_004', 'TW800', '1996-07-17', 'Atlantic Ocean (off Long Island)',   230, 'AIRLINE_002'),

('CRASH_005', 'UA232', '1989-07-19', 'Sioux City, IA',                     111, 'AIRLINE_003'),
('CRASH_006', 'UA173', '1978-12-28', 'Portland, OR',                        10, 'AIRLINE_003'),

('CRASH_007', 'LH2904','1993-09-14', 'Warsaw, Poland',                       2, 'AIRLINE_004'),

('CRASH_008', 'AF447', '2009-06-01', 'Atlantic Ocean',                     228, 'AIRLINE_005'),
('CRASH_009', 'AF296', '1988-06-26', 'Mulhouse–Habsheim, France',            3, 'AIRLINE_005');