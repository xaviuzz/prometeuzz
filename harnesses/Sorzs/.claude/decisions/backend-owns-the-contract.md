# Backend owns the contract

`openapi.yaml` lives in `backend/`. `frontend/` and `cli/` each commit a pinned copy and generate their client from it (see `generated-client-openapi-typescript-and-openapi-fetch`). No pipeline compares the copy with the backend's file; refreshing it is a manual step of the contract step. Why: explicit, versioned, one-way dependency, no cross-repo access in CI. Revisit with a published artifact if copying hurts.
