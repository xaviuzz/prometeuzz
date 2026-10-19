# {{name}}

Web app, TypeScript. An umbrella of three independent repos, each with its own pipeline and its own `CLAUDE.md` for stack and commands:

- `backend/` (`{{name}}-backend`): owns the API contract, `openapi.yaml`.
- `frontend/` (`{{name}}-frontend`): keeps a pinned copy of `openapi.yaml` and generates its client from it.
- `e2e/` (`{{name}}-e2e`): Playwright tests against `backend/` and `frontend/` composed by Docker Compose.

This file and `.claude/` hold only what crosses both repos. Decisions and their why: `.claude/decisions.md` indexes them by area, one file each in `.claude/decisions/`. Before deciding in an area, read that area's files, not all of them; record a new decision as its own file and add its line to the index.

## Vertical slices

Work one slice at a time, every slice end to end. Each step of a slice spec names the repo it changes, in this order:

1. Contract: change `openapi.yaml` in `backend/`, copy it to `frontend/`, regenerate the client.
2. Backend.
3. Frontend.

A step is done when its repo's tests, lint and build pass. Slice specs live in `.claude/specs/`.

## Working in one repo

Read that repo's `CLAUDE.md` for its stack and commands. Commit per repo with `commit-message {{name}}`; each repo gets its own commits.

## Verifying containers

The host may already run a dev server on 3000. Before probing a container by `curl`:

1. List what runs: `docker ps -a` for containers, `ss -ltn` for host ports.
2. Pick a free host port, or set the container's `PORT` to one.
3. After starting, confirm with `docker ps` and `docker logs` that the container is up and is the one answering.
