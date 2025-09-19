-- Drop tables if they already exist
DROP TABLE IF EXISTS crashes;
DROP TABLE IF EXISTS airlines;

-- Create airlines (parent table)
CREATE TABLE airlines (
    airline_id   TEXT PRIMARY KEY,
    name         TEXT NOT NULL,
    founded_year INTEGER,
    country      TEXT
);

-- Create crashes (child table)
CREATE TABLE crashes (
    crash_id     TEXT PRIMARY KEY,
    flight_no    TEXT,
    crash_date   DATE,
    location     TEXT,
    fatalities   INTEGER,
    airline_id   TEXT NOT NULL REFERENCES airlines(airline_id)
);