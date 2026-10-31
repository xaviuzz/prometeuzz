# E2E is a third repo, composing the other two

`Sorzs-e2e`, cloned as `e2e/`, holds a Docker Compose that builds `backend/` and `frontend/` from sibling paths (overridable by environment variable) and a Playwright service that runs against them. CI checks out the three repos side by side. Each of `backend/` and `frontend/` owns its own `Dockerfile`; `e2e/` only composes. Why: each repo knows how to package itself, and local runs test local code without pushing. Building from GitHub URLs was rejected: it only tests what is already pushed.
