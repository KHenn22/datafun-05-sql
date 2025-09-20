-- 03_insert_records.sql
PRAGMA foreign_keys = ON;

-- Parent table first
INSERT INTO airlines (airline_id, name, founded_year, country) VALUES
('AIRLINE_001', 'American Airlines', 1930, 'USA'),
('AIRLINE_002', 'Delta Air Lines', 1924, 'USA'),
('AIRLINE_003', 'United Airlines', 1926, 'USA'),
('AIRLINE_004', 'Lufthansa', 1953, 'Germany'),
('AIRLINE_005', 'Air France', 1933, 'France'),
('AIRLINE_006', 'Trans World Airlines', 1930, 'USA');

-- Child table: match the column list exactly to your schema
-- Note: O'Hare is escaped as O''Hare (two single quotes)
INSERT INTO crashes (crash_id, flight_no, location, airline_id, year) VALUES
('CRASH_001', 'AA587',  'Queens, NY',                             'AIRLINE_001', 2001),
('CRASH_002', 'AA191',  'Chicago, IL (O''Hare)',                  'AIRLINE_001', 1979),
('CRASH_003', 'DL191',  'Dallas, TX',                             'AIRLINE_002', 1985),
('CRASH_004', 'TW800',  'Atlantic Ocean (off Long Island)',       'AIRLINE_006', 1996),
('CRASH_005', 'UA232',  'Sioux City, IA',                         'AIRLINE_003', 1989),
('CRASH_006', 'UA173',  'Portland, OR',                           'AIRLINE_003', 1978),
('CRASH_007', 'LH2904', 'Warsaw, Poland',                         'AIRLINE_004', 1993),
('CRASH_008', 'AF447',  'Atlantic Ocean',                         'AIRLINE_005', 2009),
('CRASH_009', 'AF296',  'Mulhouse-Habsheim, France',              'AIRLINE_005', 1988),
('CRASH_010', 'TW514',  'Mount Weather, VA',                      'AIRLINE_006', 1974);