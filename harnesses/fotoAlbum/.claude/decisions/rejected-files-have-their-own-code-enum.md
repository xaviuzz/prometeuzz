# Rejected files have their own code enum

`SESSION_REQUIRED` is an `ErrorBody` code, a whole-call error answered with status 200. `UNSUPPORTED_FORMAT`, `TOO_LARGE` and `UNREADABLE_IMAGE` live in `RejectionCode`, used only by the `rejected` entries of `photo.upload`. Why: `ErrorBody` means "the call failed"; a refused file does not fail the call.
