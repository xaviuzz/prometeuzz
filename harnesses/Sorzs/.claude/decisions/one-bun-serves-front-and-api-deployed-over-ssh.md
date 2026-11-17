# One Bun serves front and API, deployed over ssh

Production is one Bun process, the backend. With `STATIC_DIR` set it serves the frontend build (`dist`) and answers every `GET` that is not an operation URL with `index.html`; a `GET` to an operation URL still answers 404. Without `STATIC_DIR` it behaves as before. `www` and `api` reach the same process, one origin, no CORS and no proxy.

The deploy is a script in `backend/deploy/` run over ssh, with no containers on the server:

- The package arrives built: `src`, `package.json`, `bun.lock`, a production `node_modules` made outside the server, and the frontend `dist`, copied with `tar` over ssh. The server never builds or runs `bun install`. It starts from source like the `Dockerfile`, not from the bundle.
- Each deploy lands in `releases/<date>`; `current` points to the live one; the last 3 stay. `DATA_DIR` lives outside `releases/`, so `sorzs.db` is never touched.
- The target comes from `DEPLOY_HOST`, `DEPLOY_USER`, `DEPLOY_PORT` (ssh only) and `DEPLOY_KEY`; the app listens on `APP_PORT` (default 3000). The script cannot tell a local test server from the real one.
- The secrets `AUTH_SECRET`, `WIKIPEDIA_CONTACT` and `SEED_USERS` come from the caller's variables. Every deploy writes them to `/etc/sorzs/sorzs.env` (mode 600, root only), which the service reads; a missing one stops the script before it touches the server.
- It is idempotent: on a clean Ubuntu 24.04 it installs `curl`, `unzip`, Bun at the version in `backend/.bun-version`, an unprivileged user and a systemd service.
- It ends on `health.check` asked from the server itself by `curl` over ssh, retried for 30 seconds; with no answer, `current` goes back to the previous release.
- `.bun-version` is the origin of the Bun version; `ci.yml` and the deploy read it, and `lint:bun-version` fails when the `FROM` of the `Dockerfile` differs.
- A `Makefile` in `backend/` starts an Ubuntu 24.04 container with systemd and sshd on 2222, on host networking (`server-up`, `server-down`), and runs the same script against it (`deploy`). A GitHub Action will later run it against the real server with secrets.

Why: the server has 512 MB, so one process and no container leave the most room; building there would run out of memory. One origin keeps the generated client on base `/`. A script that does not know its target is tested on a clean Ubuntu before it touches the real server, and moving `current` makes the rollback cheap. The health check from the server needs no open app port. A `GET` to an operation URL stays 404 so a client that picks the wrong method sees an error, not HTML.

Out for now: TLS and subdomains (Caddy), the GitHub Action and the backup of `sorzs.db`.
