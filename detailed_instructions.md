# 🧰 Step 1: Set Up Your Gear

### 1️⃣ Install SQLite

* Visit [sqlite.org/download.html](https://sqlite.org/download.html)
* Download the **precompiled binaries** for your OS (Windows/macOS/Linux)
* **Add SQLite to your PATH** so you can use `sqlite3` in your terminal

### 2️⃣ Install VS Code and the SQLite Extension

* Open the **Extensions panel** in VS Code (`Ctrl+Shift+X`)
* Search for **“SQLite”** (the one by **alexcvzz** is recommended)
* Click **Install** — allows you to open and query `.sqlite` databases directly in VS Code

---

# 🎬 Step 2: Create Your Database

```bash
sqlite3 marvel.db
```

Inside SQLite:

```sql
.tables   -- check tables (there will be none yet)
```

---

# 🚪 Exiting SQLite

### 🧭 Proper Exit

```sql
.exit
```

or

```sql
.quit
```

### 🛑 Emergency

* **Ctrl + C** → interrupts current command
* **Ctrl + D** (Linux/macOS) or **Ctrl + Z + Enter** (Windows) → force quit

> ⚠️ SQLite auto-commits — `.exit` is safe.

**Useful commands:** `.tables`, `.schema`, `.mode csv`, `.output file.csv`

---

# 🧱 Step 3: Build Your MCU Schema

### 1️⃣ Productions

```sql
CREATE TABLE Productions (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    title           TEXT NOT NULL UNIQUE,
    type            TEXT CHECK (type IN ('Movie', 'Series', 'One-Shot', 'Adjacent')) NOT NULL,
    release_date    DATE,
    mcu_phase       INTEGER,
    timeline_start  INTEGER,
    timeline_end    INTEGER,
    note            TEXT,
    created_at      DATETIME DEFAULT CURRENT_TIMESTAMP
);
```

💡 Notes: Simple, flexible, scalable; `timeline_start/end` for multi-year productions; `note` for trivia

---

### 2️⃣ Characters

```sql
CREATE TABLE Characters (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    name            TEXT NOT NULL,
    alias           TEXT,
    actor           TEXT,
    first_appearance INTEGER,
    species         TEXT DEFAULT 'Human',
    affiliation     TEXT,
    note            TEXT,
    FOREIGN KEY (first_appearance) REFERENCES Productions(id)
);
```

---

### 3️⃣ Appearances

```sql
CREATE TABLE Appearances (
    production_id   INTEGER NOT NULL,
    character_id    INTEGER NOT NULL,
    role            TEXT CHECK (role IN ('Main', 'Supporting', 'Cameo')) DEFAULT 'Supporting',
    screentime_min  REAL,
    note            TEXT,
    PRIMARY KEY (production_id, character_id),
    FOREIGN KEY (production_id) REFERENCES Productions(id) ON DELETE CASCADE,
    FOREIGN KEY (character_id) REFERENCES Characters(id) ON DELETE CASCADE
);
```

---

### 4️⃣ Phases

```sql
CREATE TABLE IF NOT EXISTS Phases (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    start_year INTEGER,
    end_year INTEGER,
    description TEXT
);
```

Load SQL files with:

```sql
.read filename.sql
```

---

# 🌱 Step 4: Seed the Data

### 1️⃣ Normalize & Parse

* Extract columns: `title`, `type`, `release_date`, `mcu_phase`, `timeline_start/end`, `note`
* Standardize dates (`YYYY-MM-DD`)
* Fill NULLs where missing

### 2️⃣ CSV Example

```csv
title,type,release_date,mcu_phase,timeline_start,timeline_end,note
Captain America: The First Avenger,Movie,2011-07-22,1,1942,1945,during WWII
Marvel’s Agent Carter (Season 1),Series,2015-01-06,1,1946,1947,
Iron Man,Movie,2008-05-02,1,2010,2010,
Venom,Adjacent,2018-10-05,,2018,2018,Sony universe connection
```

> Recommended: Keep timeline as integers, extra info in `note`

### 3️⃣ Python Script

```python
import sqlite3
import csv

conn = sqlite3.connect("marvel.db")
cur = conn.cursor()

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
```

### 4️⃣ Run

```bash
python seed_productions.py
sqlite3 marvel.db
sqlite> SELECT * FROM Productions LIMIT 5;
sqlite3 marvel.db < seed_extras.sql
```

**CSV bug:** Ensure quotes for fields with commas.

---

# 📊 Step 5: Queries

### 💡 Output Formatting

**Option 1: Built-in formatting**

```sql
.mode column
.headers on
.width 30 10 15
```

```sql
SELECT title, mcu_phase, release_date FROM Productions LIMIT 5;
```

**Option 2: Box mode (if supported)**

```sql
.mode box
```

**Option 3: Python / Pandas**

```bash
python -m sqlite3 marvel.db "SELECT title, mcu_phase, release_date FROM Productions LIMIT 5;" | column -t
```

**Bonus:** Make `.mode column` permanent with `.sqliterc` in home directory.

---

### 🔹 Example Queries

**1️⃣ Sanity checks**

```sql
SELECT COUNT(*) AS total_productions FROM Productions WHERE mcu_phase NOT NULL;

SELECT id, title, type, mcu_phase, timeline_start, timeline_end
FROM Productions
LIMIT 10;

SELECT * FROM productions
ORDER BY release_date;
```

**2️⃣ Phase-related**

```sql
SELECT mcu_phase, COUNT(*) AS num_productions
FROM Productions
WHERE mcu_phase IS NOT NULL
GROUP BY mcu_phase
ORDER BY mcu_phase;

SELECT mcu_phase, COUNT(*) AS production_count
FROM productions
GROUP BY mcu_phase
ORDER BY production_count DESC;

SELECT *
FROM productions
WHERE type = 'Series' AND mcu_phase = 4
ORDER BY title;

SELECT mcu_phase AS phase,
       ROUND(AVG(CAST(strftime('%Y', release_date) AS INTEGER)), 2) AS rounded_avg_year
FROM productions
WHERE mcu_phase IS NOT NULL
GROUP BY mcu_phase;
```

**3️⃣ Timeline exploration**

```sql
SELECT MIN(timeline_start) AS first_year, MAX(timeline_end) AS last_year
FROM Productions
WHERE mcu_phase IS NOT NULL;

SELECT title, type, mcu_phase, note
FROM Productions
WHERE timeline_start <= 2024 AND timeline_end >= 2024
ORDER BY release_date;
```
…
…
[more queries]
…
…

---

# 🏆 Learning Outcomes & Next Steps

### 💡 Key Skills Gained

**1. Database Fundamentals**

* Design relational schemas (one-to-many, many-to-many)
* Create tables with primary/foreign keys and constraints
* Maintain referential integrity and handle cascading deletes

**2. Data Handling & Normalization**

* Clean and normalize raw data for consistency
* Standardize annotations and map CSV data into tables
* Apply Python scripts to automate data ingestion

**3. Querying & Analysis**

* Write basic and advanced SQL queries
* Use aggregation (`COUNT`, `AVG`) and grouping (`GROUP BY`)
* Filter, sort, and explore timelines, characters, and productions

**4. Toolchain Familiarity**

* Work with SQLite in terminal and VS Code
* Seed databases with Python scripts
* Improve output readability using formatting commands

**5. Project Workflow**

* Plan and structure a project from setup → schema → seeding → querying
* Debug CSV or script-related issues
* Understand how schema design affects queries and analysis

---

### 🌱 Opportunities for Growth

**Database Design Enhancements**

* Add tables for directors, studios, box office revenue
* Use advanced constraints, triggers, or indexes
* Further normalize schema (e.g., affiliations lookup table)

**Advanced SQL**

* Explore joins, subqueries, CTEs, and window functions
* Generate reports: top actors, most prolific directors, character appearances

**Data Visualization**

* Use Pandas, Matplotlib, or Seaborn to create charts
* Visualize MCU timelines, character connections, or phase distributions

**Full-stack Extensions**

* Build a web dashboard with Flask, Django, or FastAPI
* Query the SQLite DB via a web interface for dynamic tables or graphs

**Cross-DB Skills**

* Migrate to PostgreSQL, MySQL, or SQL Server
* Compare data types, indexing strategies, and performance features

**Portfolio Development**

* Document project with queries, visualizations, and analysis
* Share on GitHub or portfolio to showcase full-stack data skills

---

### 📚 Theoretical Insights

Hands-on practice is essential, but **understanding theory makes your work robust**:

* Study **normalization (1NF–BCNF), relational algebra, indexing, and schema principles**
* Learn terminology, best practices, and trade-offs to design efficient databases
* Pairing **practical projects with theory** deepens understanding and prepares you for advanced database design and data engineering

---

> 🚀 **Summary:** This project simulates a real-world workflow — schema design, data cleaning/loading, querying, and visualization. Expanding it opens doors to advanced SQL, data analysis, visualization, and full-stack development.
