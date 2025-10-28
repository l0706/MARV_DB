import sqlite3
import matplotlib.pyplot as plt

# Connect to the database
conn = sqlite3.connect("marvel.db")
cur = conn.cursor()

# Here, you can filter out extreme outliers (e.g., timeline_start < 1940)
cur.execute("""
    SELECT title, timeline_start, timeline_end 
    FROM Productions 
    WHERE timeline_start NOT NULL
""")
data = cur.fetchall()
conn.close()

if data:
    titles, starts, ends = zip(*data)

    plt.figure(figsize=(10,6))
    plt.scatter(starts, ends, color='navy')
    plt.xlabel("Timeline Start Year")
    plt.ylabel("Timeline End Year")
    plt.title("MCU Timeline Overview (Excluding Outliers)")
    plt.show()
else:
    print("No data available after filtering out outliers.")
