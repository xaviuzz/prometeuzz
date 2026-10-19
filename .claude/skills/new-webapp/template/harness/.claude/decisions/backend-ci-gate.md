# Backend CI gate

GitHub Actions workflow `.github/workflows/ci.yml` on push to `main` and on pull requests: frozen install, lint, typecheck, test, build, on Bun pinned to the local version. Typecheck is in the gate because `bun build` does not check types. No deploy, cache or matrix. Why: smallest gate that matches what is run by hand; the frontend repeats it and adds the generated-client drift check.
