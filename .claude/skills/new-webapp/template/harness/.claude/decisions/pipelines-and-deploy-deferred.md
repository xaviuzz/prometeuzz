# Pipelines and deploy deferred

GitHub Actions with the same gate (lint, test, build) in both repos is the intent, chosen together with the tooling while building the boilerplates. No deploy until there is a target. Why: the TypeScript tooling is discovered while building each boilerplate.
