# E2E CI gate

`e2e/.github/workflows/ci.yml` (push to `main` and pull requests) checks out `fotoAlbum-e2e`, `fotoAlbum-backend` and `fotoAlbum-frontend` side by side under their umbrella names, installs with `npm ci` on Node 26, then runs lint, typecheck and `npm run e2e` from `e2e/`. The compose keeps host networking in CI: it works on the runner and keeps one file for both. Why: same gate shape as the other repos plus the one command that exercises the whole stack. Triggering from backend and frontend pull requests is out of scope; it needs a cross-repo token.
