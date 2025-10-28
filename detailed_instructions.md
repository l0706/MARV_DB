# 🧰 Step 1: Set Up Your Gear

### 1️⃣ Install SQLite

* Visit [sqlite.org/download.html](https://sqlite.org/download.html)
* Download the **precompiled binaries** for your OS (Windows / macOS / Linux)
* **Add SQLite to your PATH** so you can use `sqlite3` in your terminal

### 2️⃣ Install VS Code and the SQLite Extension

* Open the **Extensions panel** in VS Code (`Ctrl+Shift+X`)
* Search for **“SQLite”** (the one by **alexcvzz** is recommended)
* Click **Install** — this allows you to open and query `.sqlite` databases directly in VS Code

---

# 🎬 Step 2: Create Your Database

Inside your project folder, run:

```bash
sqlite3 marvel.db
```

This creates a file named `marvel.db`.

Inside the SQLite prompt:

```sql
.tables   -- check tables (there will be none yet)
```

Then, start creating your tables!

---

# 🚪 Exiting SQLite

### 🧭 The Proper Exit Route

At the `sqlite>` prompt, type:

```sql
.exit
```

or

```sql
.quit
```

Press **Enter**. This ensures SQLite:

* Writes pending changes to disk
* Closes the database file
* Returns you to your normal terminal prompt (`$`, `>`, or `PS>`)

### 🛑 Emergency Exits

If something goes wrong mid-query:

* **Ctrl + C** — interrupts the current command (SQLite stays open)
* **Ctrl + D** (Linux/macOS) or **Ctrl + Z + Enter** (Windows) — force quit entirely

> ⚠️ Note: Even if you’ve run `INSERT` or `UPDATE` statements without manually committing, SQLite auto-commits, so `.exit` won’t make you lose data.

---

💡 **Pro Tip:**
There are several handy **SQLite shell commands** (starting with `.`) that make life easier, such as:

* `.tables` → list all tables
* `.schema` → inspect table schemas
* `.mode csv` + `.output file.csv` → export data to CSV

---

I can also make an **even more visually appealing “cheat sheet” version** with color-coded sections and a compact layout that’s perfect for quick reference.

Do you want me to do that next?
