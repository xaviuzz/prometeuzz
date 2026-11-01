# Compose waits on healthchecks

Backend and frontend declare a `healthcheck`; the runner uses `depends_on` with `condition: service_healthy`. The sample site does the same in its own file (`sample-site-has-its-own-compose-file`). One command, `npm run e2e` (`docker compose up --build --abort-on-container-exit --exit-code-from e2e` over both files), runs it all. Why: no `sleep`, and the exit code serves CI.
