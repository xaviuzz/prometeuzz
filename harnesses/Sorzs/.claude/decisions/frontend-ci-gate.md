# Frontend CI gate

Same workflow as the backend (`.github/workflows/ci.yml`, push to `main` and pull requests, Bun 1.4.3, frozen install, lint, typecheck, test, build) plus `generate:check` as the last step. Why: one gate shape in both repos; the drift check is the only addition the frontend needs.
