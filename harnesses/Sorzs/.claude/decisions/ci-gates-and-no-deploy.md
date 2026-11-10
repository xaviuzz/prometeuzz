# CI gates; no deploy

Each repo runs a GitHub Actions workflow, `.github/workflows/ci.yml`, with one `gate` job, on push to `main` and on pull requests. No cache and no matrix.

- `backend/`, `frontend/` and `cli/`: Bun 1.4.3, frozen install, lint, typecheck, test, build. The frontend and the CLI add `generate:check` as the last step. Typecheck is in the gate because `bun build` does not check types.
- `e2e/`: checks out `Sorzs-e2e`, `Sorzs-backend` and `Sorzs-frontend` side by side under their umbrella names, installs with `npm ci` on Node 26, then runs lint, typecheck and `npm run e2e` from `e2e/`. The compose keeps host networking in CI: it works on the runner and keeps one file for both.

No deploy until there is a target. Triggering e2e from backend and frontend pull requests is out of scope; it needs a cross-repo token.

Why: the smallest gate that matches what is run by hand, with one shape in the four repos; the drift check of the frontend and the CLI and e2e's whole-stack command are the only additions.
