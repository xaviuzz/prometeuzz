# The backend receives the session identity

Calls carry an optional `sessionId` in the call header, supplied by the client. `photo.list` and `photo.upload` require it and answer `SESSION_REQUIRED` without it; every other operation ignores it. The backend neither issues nor validates sessions, and checks only that the code is safe as a folder name. Why: photos are the first data that must belong to a session, which "Anonymous session lives in the browser" deferred; this narrows that decision (the session is still made and kept by the frontend) without replacing it.
