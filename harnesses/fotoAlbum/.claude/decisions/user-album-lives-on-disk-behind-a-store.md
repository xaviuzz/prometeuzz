# User album lives on disk behind a store

A `UserAlbumStore` keeps `DATA_DIR/<sessionId>/user-album.json`; the user album identity is `Bun.randomUUIDv7()`. Why: same reasoning as "Photos live on disk behind a PhotoStore": it must survive a restart, a database is not worth it yet, and the store is the seam to replace later.
