# Errors live in the message

Operation failures answer HTTP 200 with `status: error`. HTTP 4xx/5xx is only for transport failures that prevent building a message: unreadable JSON or missing `callId` (400), unknown URL (404), crash outside an operation (500). First codes: `INVALID_BODY`, `INTERNAL_ERROR`. Why: one place to read the outcome of a call; domain codes arrive with the slices that need them.
