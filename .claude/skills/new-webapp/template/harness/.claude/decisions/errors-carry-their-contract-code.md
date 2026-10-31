# Errors carry their contract code

Every error that maps to an `ErrorCode` extends `CallError` and declares its code; `Call.failureFrom` answers `error.code` and falls back to `INTERNAL_ERROR` for anything else. Why: the mapping was an `instanceof` chain copied wherever a failure was answered, and each new error meant editing all of them. These errors are API errors in practice, so a code on the error costs the domain nothing. `InvalidCallError` stays the transport 400.
