# Upload errors follow the RPC rules

An upload with no `callId` or an unreadable form answers 400 `TransportError`. A valid upload with no files answers 200 with `INVALID_BODY`. Why: the same split as the JSON operations: transport faults are 400, business faults ride in the message.
