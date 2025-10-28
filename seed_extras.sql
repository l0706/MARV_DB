-- =====================================================
-- === CHARACTERS (Additional MCU Characters) =========
-- =====================================================
INSERT INTO Characters (name, alias, actor, first_appearance, species, affiliation, note)
SELECT 'Tony Stark', 'Iron Man', 'Robert Downey Jr.',
       (SELECT id FROM Productions WHERE title = 'Iron Man'),
       'Human', 'Avengers', 'Genius billionaire and founding Avenger.'
WHERE NOT EXISTS (SELECT 1 FROM Characters WHERE name='Tony Stark');

INSERT INTO Characters (name, alias, actor, first_appearance, species, affiliation, note)
SELECT 'Steve Rogers', 'Captain America', 'Chris Evans',
       (SELECT id FROM Productions WHERE title = 'Captain America: The First Avenger'),
       'Human (Enhanced)', 'Avengers', 'Super soldier from WWII, leader figure.'
WHERE NOT EXISTS (SELECT 1 FROM Characters WHERE name='Steve Rogers');

INSERT INTO Characters (name, alias, actor, first_appearance, species, affiliation, note)
SELECT 'Thor Odinson', NULL, 'Chris Hemsworth',
       (SELECT id FROM Productions WHERE title = 'Thor'),
       'Asgardian', 'Avengers', 'God of Thunder, wielder of Mjolnir.'
WHERE NOT EXISTS (SELECT 1 FROM Characters WHERE name='Thor Odinson');

INSERT INTO Characters (name, alias, actor, first_appearance, species, affiliation, note)
SELECT 'Natasha Romanoff', 'Black Widow', 'Scarlett Johansson',
       (SELECT id FROM Productions WHERE title = 'Iron Man 2'),
       'Human', 'Avengers', 'Master spy and former S.H.I.E.L.D. operative.'
WHERE NOT EXISTS (SELECT 1 FROM Characters WHERE name='Natasha Romanoff');

INSERT INTO Characters (name, alias, actor, first_appearance, species, affiliation, note)
SELECT 'Bruce Banner', 'Hulk', 'Mark Ruffalo',
       (SELECT id FROM Productions WHERE title = 'The Incredible Hulk'),
       'Human (Gamma Mutate)', 'Avengers', 'Scientist cursed with uncontrollable strength.'
WHERE NOT EXISTS (SELECT 1 FROM Characters WHERE name='Bruce Banner');

INSERT INTO Characters (name, alias, actor, first_appearance, species, affiliation, note)
SELECT 'Peter Parker', 'Spider-Man', 'Tom Holland',
       (SELECT id FROM Productions WHERE title = 'Spider-Man: Homecoming'),
       'Human (Enhanced)', 'Avengers', 'Teen hero mentored by Tony Stark.'
WHERE NOT EXISTS (SELECT 1 FROM Characters WHERE name='Peter Parker');

INSERT INTO Characters (name, alias, actor, first_appearance, species, affiliation, note)
SELECT 'TChalla', 'Black Panther', 'Chadwick Boseman',
       (SELECT id FROM Productions WHERE title = 'Black Panther'),
       'Human (Enhanced)', 'Wakanda', 'King of Wakanda and protector of Vibranium.'
WHERE NOT EXISTS (SELECT 1 FROM Characters WHERE name='TChalla');

INSERT INTO Characters (name, alias, actor, first_appearance, species, affiliation, note)
SELECT 'Carol Danvers', 'Captain Marvel', 'Brie Larson',
       (SELECT id FROM Productions WHERE title = 'Captain Marvel'),
       'Human/Kree Hybrid', 'Avengers', 'Cosmic-powered ex-pilot.'
WHERE NOT EXISTS (SELECT 1 FROM Characters WHERE name='Carol Danvers');

INSERT INTO Characters (name, alias, actor, first_appearance, species, affiliation, note)
SELECT 'Nick Fury', NULL, 'Samuel L. Jackson',
       (SELECT id FROM Productions WHERE title = 'Iron Man'),
       'Human', 'S.H.I.E.L.D.', 'The eye-patched strategist who started the Avengers Initiative.'
WHERE NOT EXISTS (SELECT 1 FROM Characters WHERE name='Nick Fury');

INSERT INTO Characters (name, alias, actor, first_appearance, species, affiliation, note)
SELECT 'Loki Laufeyson', NULL, 'Tom Hiddleston',
       (SELECT id FROM Productions WHERE title = 'Thor'),
       'Asgardian (Frost Giant)', NULL, 'Trickster, antihero, occasional multiversal chaos agent.'
WHERE NOT EXISTS (SELECT 1 FROM Characters WHERE name='Loki Laufeyson');

INSERT INTO Characters (name, alias, actor, first_appearance, species, affiliation, note)
SELECT 'Wanda Maximoff', 'Scarlet Witch', 'Elizabeth Olsen',
       (SELECT id FROM Productions WHERE title = 'Avengers: Age of Ultron'),
       'Human (Enhanced)', 'Avengers', 'Twin with Vision, possesses reality-warping powers.'
WHERE NOT EXISTS (SELECT 1 FROM Characters WHERE name='Wanda Maximoff');

INSERT INTO Characters (name, alias, actor, first_appearance, species, affiliation, note)
SELECT 'Vision', NULL, 'Paul Bettany',
       (SELECT id FROM Productions WHERE title = 'Avengers: Age of Ultron'),
       'Synthozoid', 'Avengers', 'Created by Ultron, turns hero and joins the Avengers.'
WHERE NOT EXISTS (SELECT 1 FROM Characters WHERE name='Vision');

INSERT INTO Characters (name, alias, actor, first_appearance, species, affiliation, note)
SELECT 'Sam Wilson', 'Falcon', 'Anthony Mackie',
       (SELECT id FROM Productions WHERE title = 'Captain America: The Winter Soldier'),
       'Human (Enhanced)', 'Avengers', 'Captain America’s right-hand ally, later takes up the shield.'
WHERE NOT EXISTS (SELECT 1 FROM Characters WHERE name='Sam Wilson');

INSERT INTO Characters (name, alias, actor, first_appearance, species, affiliation, note)
SELECT 'Bucky Barnes', 'Winter Soldier', 'Sebastian Stan',
       (SELECT id FROM Productions WHERE title = 'Captain America: The First Avenger'),
       'Human (Enhanced)', 'Avengers', 'Steve Rogers’ best friend turned brainwashed assassin.'
WHERE NOT EXISTS (SELECT 1 FROM Characters WHERE name='Bucky Barnes');

INSERT INTO Characters (name, alias, actor, first_appearance, species, affiliation, note)
SELECT 'Stephen Strange', 'Doctor Strange', 'Benedict Cumberbatch',
       (SELECT id FROM Productions WHERE title = 'Doctor Strange'),
       'Human', 'Masters of the Mystic Arts', 'Sorcerer Supreme, master of magic and time manipulation.'
WHERE NOT EXISTS (SELECT 1 FROM Characters WHERE name='Stephen Strange');

INSERT INTO Characters (name, alias, actor, first_appearance, species, affiliation, note)
SELECT 'Peter Quill', 'Star-Lord', 'Chris Pratt',
       (SELECT id FROM Productions WHERE title = 'Guardians of the Galaxy'),
       'Human/Celestial Hybrid', 'Guardians of the Galaxy', 'Leader of the Guardians, skilled pilot and thief.'
WHERE NOT EXISTS (SELECT 1 FROM Characters WHERE name='Peter Quill');

INSERT INTO Characters (name, alias, actor, first_appearance, species, affiliation, note)
SELECT 'Gamora', NULL, 'Zoe Saldana',
       (SELECT id FROM Productions WHERE title = 'Guardians of the Galaxy'),
       'Zen-Whoberi', 'Guardians of the Galaxy', 'Adopted daughter of Thanos, deadly assassin turned hero.'
WHERE NOT EXISTS (SELECT 1 FROM Characters WHERE name='Gamora');

INSERT INTO Characters (name, alias, actor, first_appearance, species, affiliation, note)
SELECT 'Drax', 'Drax the Destroyer', 'Dave Bautista',
       (SELECT id FROM Productions WHERE title = 'Guardians of the Galaxy'),
       'Kylosian', 'Guardians of the Galaxy', 'Vengeful warrior with literal humor.'
WHERE NOT EXISTS (SELECT 1 FROM Characters WHERE name='Drax');

INSERT INTO Characters (name, alias, actor, first_appearance, species, affiliation, note)
SELECT 'Rocket', NULL, 'Bradley Cooper (voice)',
       (SELECT id FROM Productions WHERE title = 'Guardians of the Galaxy'),
       'Genetically Modified Raccoon', 'Guardians of the Galaxy', 'Weapons expert and engineer.'
WHERE NOT EXISTS (SELECT 1 FROM Characters WHERE name='Rocket');

INSERT INTO Characters (name, alias, actor, first_appearance, species, affiliation, note)
SELECT 'Groot', NULL, 'Vin Diesel (voice)',
       (SELECT id FROM Productions WHERE title = 'Guardians of the Galaxy'),
       'Flora Colossus', 'Guardians of the Galaxy', 'Tree-like being, says only "I am Groot".'
WHERE NOT EXISTS (SELECT 1 FROM Characters WHERE name='Groot');

-- Additional newer characters
INSERT INTO Characters (name, alias, actor, first_appearance, species, affiliation, note)
SELECT 'Yelena Belova', NULL, 'Florence Pugh',
       (SELECT id FROM Productions WHERE title = 'Black Widow'),
       'Human', 'Black Widow Ops', 'Natasha’s sister, trained in Red Room.'
WHERE NOT EXISTS (SELECT 1 FROM Characters WHERE name='Yelena Belova');

INSERT INTO Characters (name, alias, actor, first_appearance, species, affiliation, note)
SELECT 'Kate Bishop', NULL, 'Hailee Steinfeld',
       (SELECT id FROM Productions WHERE title = 'Hawkeye (Season 1)'),
       'Human', 'Avengers (Young Allies)', 'Protégé of Clint Barton/Hawkeye.'
WHERE NOT EXISTS (SELECT 1 FROM Characters WHERE name='Kate Bishop');

INSERT INTO Characters (name, alias, actor, first_appearance, species, affiliation, note)
SELECT 'Kamala Khan', 'Ms. Marvel', 'Iman Vellani',
       (SELECT id FROM Productions WHERE title = 'Ms. Marvel (Season 1)'),
       'Human (Enhanced)', 'Young Avengers', 'Teen superhero inspired by Captain Marvel.'
WHERE NOT EXISTS (SELECT 1 FROM Characters WHERE name='Kamala Khan');

INSERT INTO Characters (name, alias, actor, first_appearance, species, affiliation, note)
SELECT 'Wong', NULL, 'Benedict Wong',
       (SELECT id FROM Productions WHERE title = 'Doctor Strange'),
       'Human', 'Masters of the Mystic Arts', 'Loyal ally of Doctor Strange.'
WHERE NOT EXISTS (SELECT 1 FROM Characters WHERE name='Wong');

INSERT INTO Characters (name, alias, actor, first_appearance, species, affiliation, note)
SELECT 'Shuri', NULL, 'Letitia Wright',
       (SELECT id FROM Productions WHERE title = 'Black Panther'),
       'Human (Enhanced)', 'Wakanda', 'TChalla’s sister, tech genius and warrior.'
WHERE NOT EXISTS (SELECT 1 FROM Characters WHERE name='Shuri');

INSERT INTO Characters (name, alias, actor, first_appearance, species, affiliation, note)
SELECT 'Clint Barton', 'Hawkeye', 'Jeremy Renner',
       (SELECT id FROM Productions WHERE title = 'Thor'),
       'Human', 'Avengers', 'Master archer, mentor to Kate Bishop.'
WHERE NOT EXISTS (SELECT 1 FROM Characters WHERE name='Clint Barton');

INSERT INTO Characters (name, alias, actor, first_appearance, species, affiliation, note)
SELECT 'Okoye', NULL, 'Danai Gurira',
       (SELECT id FROM Productions WHERE title = 'Black Panther'),
       'Human', 'Wakanda', 'General of the Dora Milaje.'
WHERE NOT EXISTS (SELECT 1 FROM Characters WHERE name='Okoye');

-- =====================================================
-- === APPEARANCES (Additional MCU Appearances) ======
-- =====================================================
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
 'Main', 180, 'TV show about variant redemption arc.'),

-- Wanda Maximoff / Scarlet Witch
((SELECT id FROM Productions WHERE title = 'Avengers: Age of Ultron'),
 (SELECT id FROM Characters WHERE name = 'Wanda Maximoff'),
 'Supporting', 40, 'Introduced as Sokovian enhanced human.'),
((SELECT id FROM Productions WHERE title = 'Doctor Strange in the Multiverse of Madness'),
 (SELECT id FROM Characters WHERE name = 'Wanda Maximoff'),
 'Main', 90, 'Central character in multiverse chaos storyline.'),

-- Vision
((SELECT id FROM Productions WHERE title = 'Avengers: Age of Ultron'),
 (SELECT id FROM Characters WHERE name = 'Vision'),
 'Supporting', 35, 'Created by Ultron, joins heroes.'),
((SELECT id FROM Productions WHERE title = 'Avengers: Infinity War'),
 (SELECT id FROM Characters WHERE name = 'Vision'),
 'Supporting', 50, 'Integral to Vision/Stone storyline.'),

-- Sam Wilson / Falcon
((SELECT id FROM Productions WHERE title = 'Captain America: The Winter Soldier'),
 (SELECT id FROM Characters WHERE name = 'Sam Wilson'),
 'Supporting', 30, 'Introduced as Falcon, Steve Rogers’ ally.'),
((SELECT id FROM Productions WHERE title = 'Avengers: Endgame'),
 (SELECT id FROM Characters WHERE name = 'Sam Wilson'),
 'Supporting', 20, 'Participates in final battle.'),
((SELECT id FROM Productions WHERE title = 'The Falcon and the Winter Soldier (Season 1)'),
 (SELECT id FROM Characters WHERE name = 'Sam Wilson'),
 'Main', 180, 'Lead role alongside Bucky in post-Endgame series.'),

-- Bucky Barnes / Winter Soldier
((SELECT id FROM Productions WHERE title = 'Captain America: The Winter Soldier'),
 (SELECT id FROM Characters WHERE name = 'Bucky Barnes'),
 'Supporting', 35, 'Brainwashed assassin, later redeemed.'),
((SELECT id FROM Productions WHERE title = 'Avengers: Infinity War'),
 (SELECT id FROM Characters WHERE name = 'Bucky Barnes'),
 'Supporting', 25, 'Fights alongside heroes against Thanos.'),
((SELECT id FROM Productions WHERE title = 'The Falcon and the Winter Soldier (Season 1)'),
 (SELECT id FROM Characters WHERE name = 'Bucky Barnes'),
 'Main', 180, 'Lead role alongside Sam in post-Endgame series.'),

-- Doctor Strange
((SELECT id FROM Productions WHERE title = 'Doctor Strange'),
 (SELECT id FROM Characters WHERE name = 'Stephen Strange'),
 'Main', 115, 'Origin story, learns the mystic arts.'),
((SELECT id FROM Productions WHERE title = 'Avengers: Infinity War'),
 (SELECT id FROM Characters WHERE name = 'Stephen Strange'),
 'Supporting', 25, 'Assists heroes against Thanos.'),

-- Guardians of the Galaxy
((SELECT id FROM Productions WHERE title = 'Guardians of the Galaxy'),
 (SELECT id FROM Characters WHERE name = 'Peter Quill'),
 'Main', 100, 'Leader of the Guardians.'),
((SELECT id FROM Productions WHERE title = 'Guardians of the Galaxy'),
 (SELECT id FROM Characters WHERE name = 'Gamora'),
 'Main', 95, 'Tragic backstory, joins the team.'),
((SELECT id FROM Productions WHERE title = 'Guardians of the Galaxy'),
 (SELECT id FROM Characters WHERE name = 'Drax'),
 'Supporting', 60, 'Comic relief and warrior.'),
((SELECT id FROM Productions WHERE title = 'Guardians of the Galaxy'),
 (SELECT id FROM Characters WHERE name = 'Rocket'),
 'Supporting', 50, 'Tech genius, small stature.'),
((SELECT id FROM Productions WHERE title = 'Guardians of the Galaxy'),
 (SELECT id FROM Characters WHERE name = 'Groot'),
 'Supporting', 50, 'Tree-like alien companion.'),

-- Yelena Belova
((SELECT id FROM Productions WHERE title = 'Black Widow'),
 (SELECT id FROM Characters WHERE name = 'Yelena Belova'),
 'Supporting', 50, 'Introduced in Natasha’s origin story.'),
((SELECT id FROM Productions WHERE title = 'Hawkeye (Season 1)'),
 (SELECT id FROM Characters WHERE name = 'Yelena Belova'),
 'Supporting', 60, 'Continues her story post-Black Widow.'),

-- Kate Bishop
((SELECT id FROM Productions WHERE title = 'Hawkeye (Season 1)'),
 (SELECT id FROM Characters WHERE name = 'Kate Bishop'),
 'Main', 180, 'Central character training under Clint Barton.'),

-- Kamala Khan / Ms. Marvel
((SELECT id FROM Productions WHERE title = 'Ms. Marvel (Season 1)'),
 (SELECT id FROM Characters WHERE name = 'Kamala Khan'),
 'Main', 180, 'Teen superhero discovering powers and identity.');

-- Additional:

INSERT INTO Appearances (production_id, character_id, role, screentime_min, note)
SELECT (SELECT id FROM Productions WHERE title = 'Black Panther'), 
       (SELECT id FROM Characters WHERE name = 'Shuri'), 
       'Supporting', 40, 'TChalla’s sister, Wakandan tech genius.'
WHERE NOT EXISTS (
    SELECT 1 FROM Appearances 
    WHERE character_id = (SELECT id FROM Characters WHERE name='Shuri') 
      AND production_id = (SELECT id FROM Productions WHERE title='Black Panther')
);

INSERT INTO Appearances (production_id, character_id, role, screentime_min, note)
SELECT (SELECT id FROM Productions WHERE title = 'Black Panther'), 
       (SELECT id FROM Characters WHERE name = 'Okoye'), 
       'Supporting', 45, 'Leader of the Dora Milaje, fierce warrior.'
WHERE NOT EXISTS (
    SELECT 1 FROM Appearances 
    WHERE character_id = (SELECT id FROM Characters WHERE name='Okoye') 
      AND production_id = (SELECT id FROM Productions WHERE title='Black Panther')
);

INSERT INTO Appearances (production_id, character_id, role, screentime_min, note)
SELECT (SELECT id FROM Productions WHERE title = 'Thor: Ragnarok'), 
       (SELECT id FROM Characters WHERE name = 'Loki Laufeyson'), 
       'Supporting', 50, 'Brotherly rival, schemes in Sakaar.'
WHERE NOT EXISTS (
    SELECT 1 FROM Appearances 
    WHERE character_id = (SELECT id FROM Characters WHERE name='Loki Laufeyson') 
      AND production_id = (SELECT id FROM Productions WHERE title='Thor: Ragnarok')
);

INSERT INTO Appearances (production_id, character_id, role, screentime_min, note)
SELECT (SELECT id FROM Productions WHERE title = 'Doctor Strange'), 
       (SELECT id FROM Characters WHERE name = 'Wong'), 
       'Supporting', 30, 'Ally and fellow sorcerer.'
WHERE NOT EXISTS (
    SELECT 1 FROM Appearances 
    WHERE character_id = (SELECT id FROM Characters WHERE name='Wong') 
      AND production_id = (SELECT id FROM Productions WHERE title='Doctor Strange')
);

INSERT INTO Appearances (production_id, character_id, role, screentime_min, note)
SELECT (SELECT id FROM Productions WHERE title = 'Avengers: Infinity War'), 
       (SELECT id FROM Characters WHERE name = 'Shuri'), 
       'Supporting', 20, 'Supports Wakanda battle.'
WHERE NOT EXISTS (
    SELECT 1 FROM Appearances 
    WHERE character_id = (SELECT id FROM Characters WHERE name='Shuri') 
      AND production_id = (SELECT id FROM Productions WHERE title='Avengers: Infinity War')
);

INSERT INTO Appearances (production_id, character_id, role, screentime_min, note)
SELECT (SELECT id FROM Productions WHERE title = 'Avengers: Infinity War'), 
       (SELECT id FROM Characters WHERE name = 'Okoye'), 
       'Supporting', 25, 'Fights in Wakanda battle.'
WHERE NOT EXISTS (
    SELECT 1 FROM Appearances 
    WHERE character_id = (SELECT id FROM Characters WHERE name='Okoye') 
      AND production_id = (SELECT id FROM Productions WHERE title='Avengers: Infinity War')
);

INSERT INTO Appearances (production_id, character_id, role, screentime_min, note)
SELECT (SELECT id FROM Productions WHERE title = 'Loki (Season 1)'), 
       (SELECT id FROM Characters WHERE name = 'Loki Laufeyson'), 
       'Main', 180, 'Leads TV show exploring multiverse variants.'
WHERE NOT EXISTS (
    SELECT 1 FROM Appearances 
    WHERE character_id = (SELECT id FROM Characters WHERE name='Loki Laufeyson') 
      AND production_id = (SELECT id FROM Productions WHERE title='Loki (Season 1)')
);

INSERT INTO Appearances (production_id, character_id, role, screentime_min, note)
SELECT (SELECT id FROM Productions WHERE title = 'Hawkeye (Season 1)'), 
       (SELECT id FROM Characters WHERE name = 'Clint Barton'), 
       'Main', 180, 'Mentor to Kate Bishop, central series character.'
WHERE NOT EXISTS (
    SELECT 1 FROM Appearances 
    WHERE character_id = (SELECT id FROM Characters WHERE name='Clint Barton') 
      AND production_id = (SELECT id FROM Productions WHERE title='Hawkeye (Season 1)')
);

INSERT INTO Appearances (production_id, character_id, role, screentime_min, note)
SELECT (SELECT id FROM Productions WHERE title = 'Ms. Marvel (Season 1)'), 
       (SELECT id FROM Characters WHERE name = 'Kamala Khan'), 
       'Main', 180, 'Protagonist discovering her powers.'
WHERE NOT EXISTS (
    SELECT 1 FROM Appearances 
    WHERE character_id = (SELECT id FROM Characters WHERE name='Kamala Khan') 
      AND production_id = (SELECT id FROM Productions WHERE title='Ms. Marvel (Season 1)')
);

INSERT INTO Appearances (production_id, character_id, role, screentime_min, note)
SELECT (SELECT id FROM Productions WHERE title = 'Doctor Strange in the Multiverse of Madness'), 
       (SELECT id FROM Characters WHERE name = 'Wong'), 
       'Supporting', 40, 'Helps Strange navigate multiversal threats.'
WHERE NOT EXISTS (
    SELECT 1 FROM Appearances 
    WHERE character_id = (SELECT id FROM Characters WHERE name='Wong') 
      AND production_id = (SELECT id FROM Productions WHERE title='Doctor Strange in the Multiverse of Madness')
);


-- === PHASES ===
INSERT INTO Phases (name, start_year, end_year, description) VALUES
('Phase 1', 2008, 2012, 'The Avengers Initiative begins — origin stories for Iron Man, Thor, Cap, and Hulk lead to the first team-up.'),
('Phase 2', 2013, 2015, 'The MCU expands its cosmic side — sequels, Guardians, and Ultron’s rise.'),
('Phase 3', 2016, 2019, 'Civil War divides heroes, Thanos collects stones, and the Infinity Saga concludes.'),
('Phase 4', 2021, 2022, 'Post-Endgame new heroes emerge; multiverse cracks open.'),
('Phase 5', 2023, 2025, 'Multiverse Saga deepens — Kang, cosmic turmoil, and grounded Disney+ arcs.'),
('Phase 6', 2025, 2027, 'Future phase — culminating the Multiverse Saga, likely with Secret Wars-scale stakes.');
