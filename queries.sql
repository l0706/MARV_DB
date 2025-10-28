-- 1. Basic sanity checks (to make sure your tables look good and your data is there)

-- Count total (MCM) productions
SELECT COUNT(*) AS total_productions FROM Productions WHERE mcu_phase NOT NULL;

-- Peek at your first few rows
SELECT id, title, type, mcu_phase, timeline_start, timeline_end
FROM Productions
LIMIT 10;

-- Show all productions ordered by release date, from earliest to latest
SELECT *
FROM productions
ORDER BY release_date;



-- 2. Phase-related queries

-- Check how many entries per phase
SELECT mcu_phase, COUNT(*) AS num_productions
FROM Productions
WHERE mcu_phase IS NOT NULL
GROUP BY mcu_phase
ORDER BY mcu_phase;
-- Or… Find which MCU phase has the most productions
SELECT mcu_phase, COUNT(*) AS production_count
FROM productions
GROUP BY mcu_phase
ORDER BY production_count DESC;

-- Display only the TV shows (Series) released during Phase 4
SELECT *
FROM productions
WHERE type = 'Series'
  AND mcu_phase = 4
ORDER BY title;

-- Get the average release year per MCU phase
SELECT mcu_phase AS phase,
       ROUND(AVG(CAST(strftime('%Y', release_date) AS INTEGER)), 2) AS rounded_avg_year
FROM productions
WHERE mcu_phase IS NOT NULL
GROUP BY mcu_phase;



-- 3. Timeline exploration

-- Find the earliest and latest years covered in the MCU timeline
SELECT MIN(timeline_start) AS first_year, MAX(timeline_end) AS last_year
FROM Productions
WHERE mcu_phase IS NOT NULL;

-- All productions that happen in or around 2024
SELECT title, type, mcu_phase, note
FROM Productions
WHERE timeline_start <= 2024 AND timeline_end >= 2024
ORDER BY release_date;



-- 4. Cross-table querying (Characters + Productions) (which character appeared where, who’s the busiest hero, etc)
-- Obviously the results of these queries are missing a lot due to missing data in the characters and appearances table

-- Productions with the Most Heroes
SELECT p.title, COUNT(a.character_id) AS num_characters
FROM Productions p
JOIN Appearances a ON p.id = a.production_id
GROUP BY p.id
ORDER BY num_characters DESC
LIMIT 10;

-- List all productions where Tony Stark appears
SELECT p.title, p.release_date, p.mcu_phase, a.role
FROM Characters c
JOIN Appearances a ON c.id = a.character_id
JOIN Productions p ON a.production_id = p.id
WHERE c.name = 'Tony Stark';

-- Busiest Heroes: Most appearances across productions
SELECT c.name, COUNT(a.production_id) AS num_appearances
FROM Characters c
JOIN Appearances a ON c.id = a.character_id
GROUP BY c.id
ORDER BY num_appearances DESC
LIMIT 10;

-- Average Screen Time per Hero
SELECT c.name, SUM(a.screentime_min) AS total_minutes, 
       ROUND(AVG(a.screentime_min),2) AS avg_per_appearance
FROM Characters c
JOIN Appearances a ON c.id = a.character_id
GROUP BY c.id
ORDER BY total_minutes DESC
LIMIT 10;

-- Main vs Supporting Roles per Hero
SELECT c.name, a.role, COUNT(*) AS num_appearances
FROM Characters c
JOIN Appearances a ON c.id = a.character_id
GROUP BY c.name, a.role
ORDER BY num_appearances DESC;

-- First Appearance of Each Character
SELECT c.name, MIN(p.release_date) AS first_appearance
FROM Characters c
JOIN Appearances a ON c.id = a.character_id
JOIN Productions p ON a.production_id = p.id
GROUP BY c.name
ORDER BY first_appearance;

-- Character Co-Appearances (Team-ups)
SELECT c1.name AS char1, c2.name AS char2, COUNT(*) AS co_appearances
FROM Appearances a1
JOIN Appearances a2 ON a1.production_id = a2.production_id AND a1.character_id < a2.character_id
JOIN Characters c1 ON a1.character_id = c1.id
JOIN Characters c2 ON a2.character_id = c2.id
GROUP BY c1.id, c2.id
ORDER BY co_appearances DESC
LIMIT 20;

-- Loki Multiverse Variants and Appearances (we do not have enough data)
SELECT p.title, a.role, a.screentime_min
FROM Characters c
JOIN Appearances a ON c.id = a.character_id
JOIN Productions p ON a.production_id = p.id
WHERE c.name LIKE 'Loki%'
ORDER BY p.release_date;



-- 5. Additional queries

SELECT p.title,
       ph.name,
       p.release_date,
       p.timeline_start,
       p.timeline_end
FROM Productions p
JOIN Phases ph ON p.mcu_phase = ph.id
ORDER BY p.mcu_phase, p.release_date;

-- Non-MCU adaptations
SELECT title, release_date, note
FROM Productions
WHERE mcu_phase IS NULL
ORDER BY release_date;

-- List all productions that have "Spider-Man" in the title
SELECT title
FROM productions
WHERE title LIKE '%Spider-Man%';

-- List all productions released between 2017 and 2019, showing title and phase
SELECT title, mcu_phase, release_date
FROM productions
WHERE strftime('%Y', release_date) BETWEEN '2017' AND '2019'
ORDER BY release_date;

-- Average MCU phase length in years (based on timeline_start/timeline_end)
SELECT mcu_phase,
       ROUND(AVG(timeline_end - timeline_start), 2) AS avg_timeline_span
FROM Productions
WHERE mcu_phase IS NOT NULL
GROUP BY mcu_phase;
