# The CLI builds its client on every call

`LocatedLogin` reads the backend address from `BackendLocation` and builds the generated client for each call, then delegates to `ApiLogin`. Why: `backend <address>` changes the address while the prompt is open, so a client built once at start would keep calling the old service. `BackendLocation.current()` is public for this reason.
