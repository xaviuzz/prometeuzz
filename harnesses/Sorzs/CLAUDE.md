# Sorzs

Web app, TypeScript. An umbrella of four independent repos, each with its own pipeline and its own `CLAUDE.md` for stack and commands:

- `backend/` (`Sorzs-backend`): owns the API contract, `openapi.yaml`.
- `frontend/` (`Sorzs-frontend`): keeps a pinned copy of `openapi.yaml` and generates its client from it.
- `cli/` (`Sorzs-cli`): a terminal prompt to manage Sorzs; keeps a pinned copy of `openapi.yaml` and generates its client from it (`.claude/docs/cli.md`).
- `e2e/` (`Sorzs-e2e`): Playwright tests against `backend/` and `frontend/` composed by Docker Compose.

## What Sorzs is

Sorzs lets Xavier search the web without leaving the sites they trust. Xavier registers the sorzs they trust, and every search returns pages from those sorzs only.

- A sorz is singular and has its own identifier. The backend decides, case by case from the address, which sorz an address belongs to. A sorz is the same for anyone who registers it.
- Registering takes an address. Sorzs does not check that the site exists or is reliable: trusting is Xavier's decision. Registering a sorz already in the list says so instead of duplicating it.
- Each user names the sorzs in their list and renames them at will, as long as no two names in the list are the same. The name belongs to the user, not to the sorz.
- Trust has no degrees: a sorz is in the list or it is not. Removing one takes effect at once and leaves no trace.
- A search covers all the sorzs in the list and never widens to the open web. With no sorzs or no query it does not search. It returns links to the original pages, never answers or copied content.
- The search runs in the frontend, through a module the backend serves on demand.
- Users are kept for good and each has a personal list. `xaviuzz` and `ana` are the users the service starts with; an admin manages users in the backoffice (`.claude/docs/backoffice.md`, `.claude/docs/user.md`).

Out of scope for now: favorites, search history, topics, searching a subset of sorzs, discovering sorzs. Open: sorz suggestions and lists shared between users.

This file and `.claude/` hold only what crosses repos. Decisions and their why: `.claude/decisions.md` indexes them by area, one file each in `.claude/decisions/`. Before deciding in an area, read that area's files, not all of them; record a new decision as its own file and add its line to the index.

## Language

- Sorz: the single address Sorzs knows, the same for everyone who registers it. Code, tests, contract, commands, screen texts, docs, specs and decisions call it sorz.
- Sorz list: the sorzs one user trusts. Sorz entry: a sorz in a list with the user's name for it. Census: every sorz in at least one list, with how many users have it.
- The word "source" names none of these. Where it names something else (where a value comes from), pick the real word instead (`origin`).
- A hook (`.claude/hooks/sorz-not-source.sh` in PrometeuZZ) warns after an edit, and each repo's `lint` fails, when `source` appears under `src/`, `test/` or `tests/`. A file that must keep the word is listed, with its reason in that repo's `CLAUDE.md`, in the repo's `language-exceptions.txt`.

## Vertical slices

Work one slice at a time, every slice end to end. Each step of a slice spec names the repo it changes, in this order:

1. Contract: change `openapi.yaml` in `backend/`, copy it to `frontend/` and to `cli/` once it exists, regenerate each client.
2. Backend.
3. Frontend, or CLI.

A step is done when its repo's tests, lint and build pass. Slice specs live in `.claude/specs/`.

A step that adds a runtime dependency also updates that repo's `Dockerfile` to install it. Never defer it to the e2e step: without `node_modules`, Bun auto-installs at the first import and blocks the server.

A contract step may end with the backend correspondence test red for the new routes, and is done when that is the only failing test and `frontend/` passes `generate:check`, lint, typecheck, test and build. The backend step turns it green.

A contract step that renames or removes routes or schemas leaves `frontend/` and `cli/` red on typecheck and tests until their own steps; it is done when `generate:check` passes in both and the backend is the only repo whose correspondence test fails. Plan the rename as one spec that moves each repo in turn.

Any later edit to `openapi.yaml` repeats the contract step in the same change: copy it to `frontend/` and `cli/` and run `generate` in each. `generate:check` fails otherwise. A new route also goes into the frontend's `dev.ts` proxy; the generated client does not reach the backend otherwise.

## Working in one repo

Read that repo's `CLAUDE.md` for its stack and commands. Commit per repo with `commit-message Sorzs`; each repo gets its own commits.

A new repo takes its config (`biome.json`, `tsconfig.json`, CI, scripts) from the sibling closest in kind: `backend/` for Bun without a UI. Add only what the new repo consumes (the contract copy, `generate`, `generate:check`); copy nothing for a UI it does not have. A spec that says "as in <repo>" names that sibling.

## Verifying containers and servers

The host may already run a dev server on 3000. Before probing a container by `curl`:

1. List what runs: `docker ps -a` for containers, `ss -ltn` for host ports.
2. Pick a free host port, or set the container's `PORT` to one.
3. After starting, confirm with `docker ps` and `docker logs` that the container is up and is the one answering.

A dev server started for a check is stopped by PID: `ss -ltnp | grep :<port>`, then `kill <pid>`. `pkill -f` matches the calling shell's own command line and kills it.

A failed image build leaves a stopped container that `docker compose down` does not see. Check `docker ps -a` and `docker rm` it by name.
