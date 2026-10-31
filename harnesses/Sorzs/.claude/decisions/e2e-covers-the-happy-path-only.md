# E2E covers the happy path only

Boilerplate: one test, the green health mark. A new e2e test needs a reason it cannot be proven in `backend/` or `frontend/`. Why: e2e is slow and brittle; the red and neutral marks are already covered by frontend tests with a fake `fetch`.
