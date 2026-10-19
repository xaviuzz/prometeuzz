# Upload is its own Operation

`photo.upload` is not a `CallOperation`: it reads the form with `formData()`, builds the `Call` from the `callId` and `sessionId` fields and answers through `Reply`. Why: its input is not JSON; sharing `Call` and `Reply` is enough, a common base would not fit.
