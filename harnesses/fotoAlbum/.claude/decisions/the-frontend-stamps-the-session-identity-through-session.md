# The frontend stamps the session identity through Session

`Session` builds the call header (`callHeader`), so its identity stays private; `Albums`, `HealthCheck` and `Photos` receive the `Session` and use it for every call. `ApiProvider` reads the session and rebuilds the `Api` when it changes, so it sits inside `SessionProvider`. Why: tell, don't ask; starting over gives the new calls the new identity, which leaves the old photos unreachable. Choosing an album also changes the session, so the `Api` is rebuilt then too.
