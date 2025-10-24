CREATE TABLE Productions (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    title           TEXT NOT NULL UNIQUE,
    type            TEXT CHECK (
                        type IN ('Movie', 'Series', 'One-Shot', 'Adjacent')
                    ) NOT NULL,
    release_date    DATE,
    mcu_phase       INTEGER,
    timeline_start  INTEGER,
    timeline_end    INTEGER,
    note            TEXT,
    created_at      DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Characters (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    name            TEXT NOT NULL,
    alias           TEXT,
    actor           TEXT,
    first_appearance INTEGER,  -- FK to Productions
    species         TEXT DEFAULT 'Human',
    affiliation     TEXT,      -- e.g. "Avengers", "S.H.I.E.L.D.", "Guardians of the Galaxy"
    note            TEXT,
    FOREIGN KEY (first_appearance) REFERENCES Productions(id)
);

CREATE TABLE Appearances (
    production_id   INTEGER NOT NULL,
    character_id    INTEGER NOT NULL,
    role            TEXT CHECK (
                        role IN ('Main', 'Supporting', 'Cameo')
                    ) DEFAULT 'Supporting',
    screentime_min  REAL,
    note            TEXT,
    PRIMARY KEY (production_id, character_id),
    FOREIGN KEY (production_id) REFERENCES Productions(id) ON DELETE CASCADE,
    FOREIGN KEY (character_id) REFERENCES Characters(id) ON DELETE CASCADE
);
