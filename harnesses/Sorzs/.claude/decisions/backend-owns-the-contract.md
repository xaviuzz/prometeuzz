# Backend owns the contract

`openapi.yaml` lives in `backend/`. `frontend/` commits a pinned copy and generates its client from it; its pipeline fails when the generated client drifts from the copy. Why: explicit, versioned, one-way dependency, no cross-repo access in CI. Revisit with a published artifact if copying hurts.
