# Backend boilerplate

Repo: `backend/`. Decisions and their why: `.claude/decisions.md`. Precondition: `bun --version` works in the shell.

A step is done when its tests, lint and build pass; then mark it `- [x]`. Work test-first. Agree the seam once, then run every cycle of a step in one go.

## Target layout

```
src/
  main.ts
  server.ts
  envelope/
  operations/
    Operation.ts
    OperationRegistry.ts
    health/HealthCheck.ts
test/            mirrors src/
openapi.yaml
CLAUDE.md
```

## Steps

- [x] 1. Skeleton: `package.json`, `tsconfig.json`, Biome, `bun test` running a first test, the repo's `CLAUDE.md` with stack and commands (`test`, `lint`, `build`). Adding Biome needs Xavier's approval.
- [x] 2. Envelope: request header with required `requestId`; response header with `requestId` and `status`; error response with `code` and `message`.
- [x] 3. `Operation` and `OperationRegistry`: lookup by name, unknown name answers absence.
- [x] 4. `HealthCheck` and server: `POST /health.check` end to end. Covers 200 `ok`, 400 unreadable JSON, 400 missing `requestId`, 404 unknown URL, 200 `INVALID_REQUEST`, 200 `INTERNAL_ERROR`.
- [x] 5. `openapi.yaml` and the correspondence test between its routes and the registered operations.
- [ ] 6. GitHub Actions running lint, test and build. Record the choice in `decisions.md`.

## Out of scope

Database, auth, photo storage, logging, deploy.
