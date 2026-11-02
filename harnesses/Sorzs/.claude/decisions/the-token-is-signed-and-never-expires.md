# The token is signed and never expires

The token is the username and an HMAC-SHA256 signature made with `AUTH_SECRET`, compared in constant time; `crypto` ships with Bun, so no dependency. It carries no expiry. Why: simplicity. There is one user and no renewal flow to build. Changing `AUTH_SECRET` invalidates every token at once, which is the way to end all sessions. Expiry and renewal stay out of scope until more than one user or a real need appears.
