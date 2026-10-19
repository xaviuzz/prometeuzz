# Upload is its own Operation

`photo.upload` is not a `CallOperation`: it reads the form with `formData()`, builds the `Call` from the `callId` and `sessionId` fields and answers through `Reply`. Why: its input is not JSON; sharing `Call` and `Reply` is enough, a common base would not fit.

Replaced by [Transport is separate from operations](transport-is-separate-from-operations.md): it is still not JSON, but its transport is now `MultipartTransport`.
