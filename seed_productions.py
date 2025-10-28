import sqlite3
import csv

# Connect to the database
conn = sqlite3.connect("marvel.db")
cur = conn.cursor()

# Open CSV
with open("productions.csv", newline='', encoding='utf-8') as csvfile:
    reader = csv.DictReader(csvfile)
    for row in reader:
        cur.execute("""
            INSERT INTO Productions (
                title, type, release_date, mcu_phase, timeline_start, timeline_end, note
            ) VALUES (?, ?, ?, ?, ?, ?, ?)
        """, (
            row['title'],
            row['type'],
            row['release_date'] if row['release_date'] else None,
            int(row['mcu_phase']) if row['mcu_phase'] else None,
            int(row['timeline_start']) if row['timeline_start'] else None,
            int(row['timeline_end']) if row['timeline_end'] else None,
            row['note']
        ))

conn.commit()
conn.close()
print("✅ Productions table seeded successfully!")
