# Session identity travels in Call

`Call` reads the optional header `sessionId` and operations receive the `Call`, not only its body. A `SessionId` is required by the photo operations and is safe as a folder name (letters, digits, hyphen, underscore, 1 to 64 characters); a missing or unsafe code answers `SESSION_REQUIRED`. On the thumbnail GET an unsafe code is a 404. Why: no new error code, and the folder name can never escape `DATA_DIR`.
