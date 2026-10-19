# E2E uses committed fixtures and an explicit DATA_DIR

The e2e photos are two small real files (a JPEG and a PNG) committed in `e2e/tests/fixtures/`, so the upload runs through two real formats with no added dependency. The backend service sets `DATA_DIR` to a directory inside its container: each run starts empty and nothing reaches the host. Why: the tray test counts photos, so leftovers from an earlier run would break it. The thumbnail check waits for the image to load, because a 404 on the thumbnail route would otherwise pass.
