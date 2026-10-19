# fotoAlbum

Photo album web app, TypeScript. An umbrella of two independent repos, each with its own pipeline and its own `CLAUDE.md` for stack and commands:

- `backend/` (`fotoAlbum-backend`): owns the API contract, `openapi.yaml`.
- `frontend/` (`fotoAlbum-frontend`): keeps a pinned copy of `openapi.yaml` and generates its client from it.

This file and `.claude/` hold only what crosses both repos. Decisions and their why: `.claude/decisions.md`. Functional concepts (what each thing is, its rules, what can be done with it): `.claude/docs/`.

## Vertical slices

Work one slice at a time, every slice end to end. Slices are scoped from the concept docs in `.claude/docs/`. Each step of a slice spec names the repo it changes, in this order:

1. Contract: change `openapi.yaml` in `backend/`, copy it to `frontend/`, regenerate the client.
2. Backend.
3. Frontend.

A step is done when its repo's tests, lint and build pass. Slice specs live in `.claude/specs/`.

A step that adds a runtime dependency also updates that repo's `Dockerfile` to install it. Never defer it to the e2e step: without `node_modules`, Bun auto-installs at the first import and blocks the server.

A contract step may end with the backend correspondence test red for the new routes, and is done when that is the only failing test and `frontend/` passes `generate:check`, lint, typecheck, test and build. The backend step turns it green.

Any later edit to `openapi.yaml` repeats the contract step in the same change: copy it to `frontend/` and run `generate`. `generate:check` fails otherwise. A new route also goes into the frontend's `dev.ts` proxy; the generated client does not reach the backend otherwise.

## Working in one repo

Read that repo's `CLAUDE.md` for its stack and commands. Commit per repo with `commit-message fotoAlbum`; each repo gets its own commits.

## Verifying containers and servers

The host may already run a dev server on 3000. Before probing a container by `curl`:

1. List what runs: `docker ps -a` for containers, `ss -ltn` for host ports.
2. Pick a free host port, or set the container's `PORT` to one.
3. After starting, confirm with `docker ps` and `docker logs` that the container is up and is the one answering.

A dev server started for a check is stopped by PID: `ss -ltnp | grep :<port>`, then `kill <pid>`. `pkill -f` matches the calling shell's own command line and kills it.

A failed image build leaves a stopped container that `docker compose down` does not see. Check `docker ps -a` and `docker rm` it by name.
