# Upload is multipart, the one non-JSON operation

`photo.upload` takes `multipart/form-data` with `callId`, `sessionId` and the files, and answers a normal `Reply` listing stored and rejected files. Rejection codes: `UNSUPPORTED_FORMAT`, `TOO_LARGE`, `UNREADABLE_IMAGE`. Why: base64 in JSON adds a third to the size and holds whole photos in memory. Accepted: JPEG, PNG and WebP up to 25 MB; HEIC waits for a real need.
