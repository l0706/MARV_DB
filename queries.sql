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
