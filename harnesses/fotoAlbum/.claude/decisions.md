# fotoAlbum decisions

## Umbrella of two repos
Backend and frontend are separate repos with separate pipelines, but one project for PrometeuZZ: `Sandbox/fotoAlbum/` is a plain directory, not a repo, with its harness in `harnesses/fotoAlbum/`. Why: cross-repo specs and decisions are tracked in PrometeuZZ, and no third repo or submodule needs maintaining.

## Short clone names
GitHub repos are `fotoAlbum-backend` and `fotoAlbum-frontend`; the clones are `backend/` and `frontend/` inside the umbrella. Why: the umbrella already gives the context.

## Each repo carries its own CLAUDE.md
Stack, commands and conventions are committed in each repo. Why: both repos are ours, and each is self-describing when opened alone. The umbrella keeps only cross-repo knowledge.

## Backend owns the contract
`openapi.yaml` lives in `backend/`. `frontend/` commits a pinned copy and generates its client from it; its pipeline fails when the generated client drifts from the copy. Why: explicit, versioned, one-way dependency, no cross-repo access in CI. Revisit with a published artifact if copying hurts.

## Pipelines and deploy deferred
GitHub Actions with the same gate (lint, test, build) in both repos is the intent, chosen together with the tooling while building the boilerplates. No deploy until there is a target. Why: the TypeScript tooling is discovered while building each boilerplate.

## Vertical slices, health check first
Work in vertical slices (contract, backend, frontend). The first slice is a health endpoint through to a frontend page, to prove the contract pipeline before real features depend on it.
