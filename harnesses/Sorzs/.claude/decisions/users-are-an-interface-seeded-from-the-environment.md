# Users are an interface seeded from the environment

`Users` is an interface the domain owns, with an in-memory implementation; the password is stored hashed with `Bun.password`. The one user comes from `SEED_USER` and `SEED_PASSWORD`, and the backend refuses to start without them or without `AUTH_SECRET`. Why: `src/` holds no literal credentials, and the interface lets a persistent store replace the memory one later without touching the domain, as with the page reader (`the-page-reader-is-an-interface-the-domain-owns`). Development and e2e set `xaviuzz` and `p1casso`.
