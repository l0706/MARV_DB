-- === CHARACTERS ===
INSERT INTO Characters (name, alias, actor, first_appearance, species, affiliation, note)
VALUES
('Tony Stark', 'Iron Man', 'Robert Downey Jr.', 
    (SELECT id FROM Productions WHERE title = 'Iron Man'), 
    'Human', 'Avengers', 'Genius billionaire and founding Avenger.'),
('Steve Rogers', 'Captain America', 'Chris Evans', 
    (SELECT id FROM Productions WHERE title = 'Captain America: The First Avenger'), 
    'Human (Enhanced)', 'Avengers', 'Super soldier from WWII, leader figure.'),
('Thor Odinson', NULL, 'Chris Hemsworth', 
    (SELECT id FROM Productions WHERE title = 'Thor'), 
    'Asgardian', 'Avengers', 'God of Thunder, wielder of Mjolnir.'),
('Natasha Romanoff', 'Black Widow', 'Scarlett Johansson', 
    (SELECT id FROM Productions WHERE title = 'Iron Man 2'), 
    'Human', 'Avengers', 'Master spy and former S.H.I.E.L.D. operative.'),
('Bruce Banner', 'Hulk', 'Mark Ruffalo', 
    (SELECT id FROM Productions WHERE title = 'The Incredible Hulk'), 
    'Human (Gamma Mutate)', 'Avengers', 'Scientist cursed with uncontrollable strength.'),
('Peter Parker', 'Spider-Man', 'Tom Holland', 
    (SELECT id FROM Productions WHERE title = 'Spider-Man: Homecoming'), 
    'Human (Enhanced)', 'Avengers', 'Teen hero mentored by Tony Stark.'),
('TChalla', 'Black Panther', 'Chadwick Boseman', 
    (SELECT id FROM Productions WHERE title = 'Black Panther'), 
    'Human (Enhanced)', 'Wakanda', 'King of Wakanda and protector of Vibranium.'),
('Carol Danvers', 'Captain Marvel', 'Brie Larson', 
    (SELECT id FROM Productions WHERE title = 'Captain Marvel'), 
    'Human/Kree Hybrid', 'Avengers', 'Cosmic-powered ex-pilot.'),
('Nick Fury', NULL, 'Samuel L. Jackson', 
    (SELECT id FROM Productions WHERE title = 'Iron Man'), 
    'Human', 'S.H.I.E.L.D.', 'The eye-patched strategist who started the Avengers Initiative.'),
('Loki Laufeyson', NULL, 'Tom Hiddleston', 
    (SELECT id FROM Productions WHERE title = 'Thor'), 
    'Asgardian (Frost Giant)', NULL, 'Trickster, antihero, occasional multiversal chaos agent.');

-- === APPEARANCES ===
INSERT INTO Appearances (production_id, character_id, role, screentime_min, note)
VALUES
-- Tony Stark
((SELECT id FROM Productions WHERE title = 'Iron Man'),
 (SELECT id FROM Characters WHERE name = 'Tony Stark'),
 'Main', 120, 'Origin story.'),
((SELECT id FROM Productions WHERE title = 'Avengers: Endgame'),
 (SELECT id FROM Characters WHERE name = 'Tony Stark'),
 'Main', 75, 'Final appearance, self-sacrifice arc.'),
((SELECT id FROM Productions WHERE title = 'Spider-Man: Homecoming'),
 (SELECT id FROM Characters WHERE name = 'Tony Stark'),
 'Supporting', 15, 'Mentor figure for Peter Parker.'),

-- Steve Rogers
((SELECT id FROM Productions WHERE title = 'Captain America: The First Avenger'),
 (SELECT id FROM Characters WHERE name = 'Steve Rogers'),
 'Main', 110, 'Origin story.'),
((SELECT id FROM Productions WHERE title = 'Avengers: Endgame'),
 (SELECT id FROM Characters WHERE name = 'Steve Rogers'),
 'Main', 70, 'Passes shield to Sam Wilson.'),

-- Thor
((SELECT id FROM Productions WHERE title = 'Thor'),
 (SELECT id FROM Characters WHERE name = 'Thor Odinson'),
 'Main', 115, 'Exiled prince learns humility.'),
((SELECT id FROM Productions WHERE title = 'Avengers: Endgame'),
 (SELECT id FROM Characters WHERE name = 'Thor Odinson'),
 'Supporting', 60, 'Finds closure post-Infinity Saga.'),

-- Natasha Romanoff
((SELECT id FROM Productions WHERE title = 'Iron Man 2'),
 (SELECT id FROM Characters WHERE name = 'Natasha Romanoff'),
 'Supporting', 25, 'First appearance.'),
((SELECT id FROM Productions WHERE title = 'Black Widow'),
 (SELECT id FROM Characters WHERE name = 'Natasha Romanoff'),
 'Main', 100, 'Solo film exploring her past.'),

-- Loki
((SELECT id FROM Productions WHERE title = 'Thor'),
 (SELECT id FROM Characters WHERE name = 'Loki Laufeyson'),
 'Supporting', 40, 'Jealous brother and schemer.'),
((SELECT id FROM Productions WHERE title = 'Loki (Season 1)'),
 (SELECT id FROM Characters WHERE name = 'Loki Laufeyson'),
 'Main', 180, 'TV show about variant redemption arc.');

-- === PHASES ===
INSERT INTO Phases (name, start_year, end_year, description) VALUES
('Phase 1', 2008, 2012, 'The Avengers Initiative begins — origin stories for Iron Man, Thor, Cap, and Hulk lead to the first team-up.'),
('Phase 2', 2013, 2015, 'The MCU expands its cosmic side — sequels, Guardians, and Ultron’s rise.'),
('Phase 3', 2016, 2019, 'Civil War divides heroes, Thanos collects stones, and the Infinity Saga concludes.'),
('Phase 4', 2021, 2022, 'Post-Endgame new heroes emerge; multiverse cracks open.'),
('Phase 5', 2023, 2025, 'Multiverse Saga deepens — Kang, cosmic turmoil, and grounded Disney+ arcs.'),
('Phase 6', 2025, 2027, 'Future phase — culminating the Multiverse Saga, likely with Secret Wars-scale stakes.');
