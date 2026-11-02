# Each entry row carries its owner

The SQLite table gains an `owner` column holding the username, and every read and write of the list filters by it; the position of addition counts per owner. On start, rows saved before the column existed get `xaviuzz`. The in-memory repository keeps one list per owner, and one behavior suite runs against both. Why: one schema serves any number of users and creating a user creates no table. A table per user was rejected: it needs DDL at every new user. `xaviuzz` receives the old rows because it was the only user then (`user.md`).
