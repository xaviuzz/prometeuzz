# Logout only forgets the token in the browser

Leaving calls the session's forget path, the same one a 403 uses, with no message; there is no `auth.logout` operation and the contract does not change. The service keeps no sessions, so a copied token keeps working until `AUTH_SECRET` changes. Why: the token is stateless and never expires (`the-token-is-signed-and-never-expires`), so a server-side logout would need a revocation list for two users. Revisit with expiry, before deploying to another host or giving access to anyone else.
