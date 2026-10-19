# Compose waits on healthchecks

Backend and frontend declare a `healthcheck`; the runner uses `depends_on` with `condition: service_healthy`. One command, `docker compose up --build --abort-on-container-exit --exit-code-from e2e`, is exposed as `e2e`. Why: no `sleep`, and the exit code serves CI.
