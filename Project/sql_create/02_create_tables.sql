PRAGMA foreign_keys = ON;

-- Parent table: airlines
CREATE TABLE airlines (
    airline_id   TEXT PRIMARY KEY,
    name         TEXT NOT NULL,
    founded_year INTEGER CHECK (founded_year BETWEEN 1900 AND 2100),
    country      TEXT
);

-- Child table: crashes
CREATE TABLE crashes (
    crash_id   TEXT PRIMARY KEY,
    flight_no  TEXT,
    location   TEXT,
    airline_id TEXT NOT NULL REFERENCES airlines(airline_id),
    year       INTEGER
);