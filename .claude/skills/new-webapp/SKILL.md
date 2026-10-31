---
name: new-webapp
description: Create a TypeScript web app umbrella in Sandbox/ (backend, frontend, e2e and its harness) from the stored template.
disable-model-invocation: true
---

The template in `template/` was extracted from `Sandbox/fotoAlbum` at tag `boilerplate-v1` and refreshed at `boilerplate-v2`, set on `backend`, `frontend`, `e2e` and PrometeuZZ. fotoAlbum is the origin, not an update source: an improvement made there reaches the template by hand.

Placeholders in `template/`, in file contents and in paths: `{{name}}` (as typed) and `{{packageName}}` (`name` in lower case, for `package.json`, lockfiles and image names). `scripts/render.mjs` fills them.

Run each command as its own Bash call and read its exit status. A piped command reports the pipe's status, not the command's.

## Create

1. Ask for the **name**: letters, digits and hyphens, starting with a letter. It is the folder, the harness and the GitHub repo prefix.
2. `node .claude/skills/new-webapp/scripts/render.mjs . <name>`. It writes `Sandbox/<name>/{backend,frontend,e2e}` and `harnesses/<name>/`, then links `CLAUDE.md` and `.claude` into the umbrella. It stops when either folder exists: report that and end.
3. Verify each repo with the commands in its own `CLAUDE.md`: install from the lockfile, build, test, lint, typecheck (frontend also `generate:check`). Then run `npm run e2e` in `e2e/`. Done when every command exits 0.
   - Before `npm run e2e`, build both images with `docker build --network host -t <name>-backend backend` and the same for `frontend`: bridge networking fails in this sandbox, and compose reuses those layers.
   - Free ports and running containers: "Verifying containers" in the new umbrella's `CLAUDE.md`.
4. Ask before touching the root `CLAUDE.md` or `.claude/projects.md`. On approval, add the project to `.claude/projects.md` and, when Xavier says so, to "Current project" in the root `CLAUDE.md`.
5. Print for Xavier, who runs every git and `gh` write:
   - `! git -C Sandbox/<name>/<repo> init` for `backend`, `frontend` and `e2e`, and the three GitHub repos `<name>-backend`, `<name>-frontend`, `<name>-e2e` (the e2e CI checks out those names).
   - The frontend project skills, which the template leaves out: `shadcn-ui/ui@shadcn` and `vercel-labs/agent-skills@vercel-react-best-practices`, installed in `frontend/` with the tool that wrote the fotoAlbum `skills-lock.json`.
   - The first commits through the `commit-message` skill.

## Refresh

1. Clone the three fotoAlbum repos into `Sandbox/fotoAlbum/` when absent (URLs in `.claude/projects.md`). The clones carry no tags.
2. Diff each template file against fotoAlbum with the placeholders filled in (`sed 's/{{[a-zA-Z]*}}/X/g'`). Keep the generic changes and leave the domain out. A generic decision of fotoAlbum travels to `template/harness/.claude/decisions/` with its why and its index line.
3. Dependencies: render a scratch project under `Sandbox/TMP/`, run `bun outdated` and `npm outdated`, apply minor and patch; a major is Xavier's call (TypeScript 7 stays out: "Frontend stays on TypeScript 5"). `bun update` rewrites `"typescript": "^5"` to `^5.9.3`: restore it. `npm update` leaves the ranges in `package.json`: raise them by hand. `biome.json` carries the Biome version in `$schema`. Copy `package.json`, lockfiles and `biome.json` back to the template, turning `"<scratch name>-` into `"{{packageName}}-`.
4. Verify with a fresh render: every command of step 3 in Create, `npm run e2e` included.
5. Xavier tags the state `boilerplate-v3` in the four repos.

## Design

- The template is stored, not derived from fotoAlbum on each run: creation is deterministic and works without fotoAlbum present.
- The template holds the walking skeleton end to end: the `health.check` operation, the `HealthMark`, the e2e happy path, the CI of the three repos. Nothing of photos exists in it.
- Lockfiles travel with the template, so a new project starts on the versions of the tag. The only name inside them is the package's, which `{{packageName}}` fills.
- `skills-lock.json` and `frontend/.claude/skills` stay out: third-party content copied by hand goes stale.
- `template/harness/` holds the umbrella `CLAUDE.md`, `decisions.md` (an index by area over one file per decision in `decisions/`) and the three boilerplate specs. The decisions are inherited with their why, under a note saying so. The spec steps stay `- [x]`: the rendered project already contains that work and step 3 proves it.
- `render.mjs` takes the PrometeuZZ root as its first argument so a test run can render into a scratch root under `Sandbox/TMP/` and leave `harnesses/` alone. A test run that reaches `npm run e2e` leaves root-owned files in `e2e/test-results/`; Xavier removes the scratch root with `! sudo rm -rf`.
