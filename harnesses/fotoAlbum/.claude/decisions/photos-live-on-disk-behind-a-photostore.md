# Photos live on disk behind a PhotoStore

Originals and thumbnails are files under `DATA_DIR`, one folder per session; `PhotoStore` hides the layout. Why: photos are the first data that must survive a restart, and a database is not worth it yet. The store is the seam to replace later. Photo ids are UUIDs made by the backend.
