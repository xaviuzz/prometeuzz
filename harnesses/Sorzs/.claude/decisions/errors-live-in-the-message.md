# Errors live in the message

Operation failures answer HTTP 200 with `status: error`. HTTP 4xx/5xx is only for transport failures that prevent building a message: a malformed call (400, see `call-and-reply-header-and-body`), an unknown URL (404), a crash outside an operation (500), and a missing or bad token on any route but `health.check` and `auth.login` (403, code `FORBIDDEN`, checked before the `Call` is read). The 400 uses the same error body as an operation failure, with `INVALID_BODY` and a message.

Every error that maps to an `ErrorCode` extends `CallError` and declares its code; `Call.failureFrom` answers `error.code` and falls back to `INTERNAL_ERROR` for anything else. A new code is added with the error that needs it.

Why: one place to read the outcome of a call, and one error body for every failure. The mapping was an `instanceof` chain copied wherever a failure was answered, and each new error meant editing all of them; these errors are API errors in practice, so a code on the error costs the domain nothing.
