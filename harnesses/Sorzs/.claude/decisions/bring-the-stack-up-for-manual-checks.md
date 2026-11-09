# Bring the stack up for manual checks

`e2e` has `up` and `down` scripts that start and stop backend and frontend without the Playwright service. Why: trying the web against the real backend by hand needs the same composition the tests use. Networking is as in `e2e-compose-uses-host-networking`.

The CLI defaults to `http://localhost:3000`, but the stack from `up` serves the backend on 3100. Try the CLI with `SORZS_HOME=/tmp/sorzs-try SORZS_BACKEND=http://localhost:3100 bun run start`: `SORZS_BACKEND` points it at the stack, `SORZS_HOME` keeps your real `~/.config/sorzs` untouched. Check `docker ps` first; the stack may already be up.
