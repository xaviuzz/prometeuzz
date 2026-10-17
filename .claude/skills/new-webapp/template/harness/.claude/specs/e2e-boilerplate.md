# E2E boilerplate

Repos: `backend/`, `frontend/`, `e2e/` (new, `{{name}}-e2e`, created by Xavier on GitHub and cloned into the umbrella). Decisions and their why: `.claude/decisions.md`. Precondition: `docker compose version` works in the shell.

Goal: `bun run e2e` in `e2e/` builds and starts backend and frontend with Docker Compose, runs Playwright in a third service, and passes when the page shows the green mark.

A step is done when its repo's tests, lint, typecheck and build pass (in `e2e/`, when `bun run e2e` is green); then mark it `- [x]`. Work test-first. Agree the seam once, then run every cycle of a step in one go. A step marked "by hand" is marked only after Xavier confirms it. Every dependency in step 3 is approved by this spec.

## Target layout

```
e2e/
  compose.yaml
  playwright.config.ts
  tests/
    health-mark.spec.ts
  package.json
  tsconfig.json
  biome.json
  .github/workflows/ci.yml
  CLAUDE.md
backend/Dockerfile
frontend/Dockerfile
```

## Steps

- [x] 1. Backend image (`backend/`): `Dockerfile` that runs the API on port 3000; the container answers `POST /health.check`. Verify by hand with `docker build` and `docker run`. Update the repo's `CLAUDE.md`.
- [x] 2. Frontend image (`frontend/`): `Dockerfile` that runs `bun run dev` on port 5173, `API_URL` set at run time. Verify by hand against the backend image. Update the repo's `CLAUDE.md`.
- [x] 3. Skeleton (`e2e/`, structural): `package.json` on Node with `@playwright/test`, Biome and TypeScript only, `tsconfig.json`, `biome.json`, `playwright.config.ts` with `baseURL` from an environment variable, `CLAUDE.md` with stack, commands and the happy-path rule. Playwright version pinned equal to the image tag.
- [x] 4. Compose (`e2e/`): `compose.yaml` with `backend` and `frontend` built from `../backend` and `../frontend` (paths overridable by environment variable), `healthcheck` on each (`POST /health.check`; `GET /`), and an `e2e` service on `mcr.microsoft.com/playwright` that `depends_on` both with `condition: service_healthy`. Script `e2e`: `docker compose up --build --abort-on-container-exit --exit-code-from e2e`. In this sandbox bridge networking fails (`operation not supported`); if Compose cannot start, fall back to `network_mode: host` with a distinct port per service, and record it in `decisions.md`.
- [x] 5. Happy path, test-first: `tests/health-mark.spec.ts` opens `/` and expects `getByRole("status", { name: "Service is up" })` visible. Red first (stop the backend: the test fails on "Service is down"), then green with `bun run e2e`.
- [x] 6. GitHub Actions in `e2e/.github/workflows/ci.yml`: checkout of the three repos side by side, frozen install, lint, typecheck, `e2e`. Record the choice in `decisions.md`. Triggering from backend and frontend pull requests is out of scope.

## Out of scope

Red and neutral marks (the frontend tests cover them), photo features, a production frontend server, deploy, triggering e2e from the other repos. Any new e2e test needs a reason it cannot live in `backend/` or `frontend/`.
