-- All characters who appeared in Phase 4 productions
SELECT c.name, c.alias, p.title
FROM Characters c
JOIN Appearances a ON c.id = a.character_id
JOIN Productions p ON p.id = a.production_id
WHERE p.mcu_phase = 4
ORDER BY c.name;

-- Count how many productions each character appears in
SELECT c.name, COUNT(*) AS appearances_count
FROM Characters c
JOIN Appearances a ON c.id = a.character_id
GROUP BY c.id
ORDER BY appearances_count DESC;

-- Find productions that feature at least one non-human character
SELECT DISTINCT p.title
FROM Productions p
JOIN Appearances a ON p.id = a.production_id
JOIN Characters c ON c.id = a.character_id
WHERE c.species != 'Human';

-- Count the movies/ series in each phase
SELECT 
    mcu_phase AS phase,
    SUM(CASE WHEN type = 'Movie' THEN 1 ELSE 0 END) AS movie_count,
    SUM(CASE WHEN type = 'Series' THEN 1 ELSE 0 END) AS series_count
FROM Productions
WHERE mcu_phase IS NOT NULL
GROUP BY mcu_phase
ORDER BY mcu_phase;
-- or (using COUNT)
SELECT 
    ph.name AS phase,
    COUNT(CASE WHEN p.type = 'Movie' THEN 1 END) AS movie_count,
    COUNT(CASE WHEN p.type = 'Series' THEN 1 END) AS series_count
FROM Productions p
JOIN Phases ph
    ON p.mcu_phase = ph.id
GROUP BY ph.name
ORDER BY movie_count DESC;
-- or (using FILTER)
SELECT
    mcu_phase AS phase,
    COUNT(*) FILTER (WHERE type='Movie') AS movie_count,
    COUNT(*) FILTER (WHERE type='Series') AS series_count
FROM Productions
WHERE mcu_phase IS NOT NULL
GROUP BY mcu_phase
ORDER BY mcu_phase;
