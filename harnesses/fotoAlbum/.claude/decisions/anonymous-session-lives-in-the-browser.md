# Anonymous session lives in the browser

The anonymous session (`docs/session.md`) is created and kept by the frontend alone, in the browser's storage; the backend knows nothing of it and the contract does not change. Why: the slice is pure interaction. The backend receives the session when something (concrete albums) must belong to one, and the way it is issued is decided then.
