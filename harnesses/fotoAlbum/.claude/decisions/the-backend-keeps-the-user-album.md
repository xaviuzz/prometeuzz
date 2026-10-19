# The backend keeps the user album

The user album is stored by the backend against the session identity; the browser keeps only the identity. On entering, the frontend asks `userAlbum.get` whether the session has one. Why: Xavier's choice, "the app keeps the user album, not the browser", so it survives clearing browser storage and later holds the faces' content. Replaces the chosen album held in the browser by "Choosing an album is recorded in the anonymous session" and narrows "Anonymous session lives in the browser" further.
