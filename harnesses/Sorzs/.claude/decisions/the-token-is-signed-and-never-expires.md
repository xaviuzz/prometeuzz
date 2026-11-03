# The token is signed and never expires

The token is the username and an HMAC-SHA256 signature made with `AUTH_SECRET`, compared in constant time; `crypto` ships with Bun, so no dependency. It carries no expiry. Why: simplicity. The two users are trusted and there is no renewal flow to build. Changing `AUTH_SECRET` invalidates every token at once, which is the way to end all sessions. Expiry and renewal stay out of scope until the backend is deployed to another host or anyone else gets access.
