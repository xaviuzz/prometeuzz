# The CLI keeps the typed username with the pass

The prompt shows `username@sorzs <role symbol>`. The login reply carries only token and role, so the CLI keeps the username the user typed when entering, inside the stored pass. Why: it avoids a contract change across backend, frontend and CLI for a label only the CLI shows. A pass stored before this has no username; it reads as an empty one and the prompt omits the name until the next login.
