# A new session is stored when it starts

The session provider saves the session it starts with, also when it had to make a new one. Why: the user album belongs to the session identity, so an identity that lives only in memory is lost on reload and the user album becomes unreachable. Until the pages step, choosing an album saved the session as a side effect; removing that left nothing saving the first one, and only the e2e reload test caught it.
