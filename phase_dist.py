import sqlite3
import matplotlib.pyplot as plt

conn = sqlite3.connect("marvel.db")
cur = conn.cursor()

cur.execute("SELECT mcu_phase, COUNT(*) FROM Productions WHERE mcu_phase IS NOT NULL GROUP BY mcu_phase")
data = cur.fetchall()
conn.close()

phases, counts = zip(*data)

plt.bar(phases, counts, color='crimson')
plt.xlabel("MCU Phase")
plt.ylabel("Number of Productions")
plt.title("Productions per MCU Phase")
plt.show()
