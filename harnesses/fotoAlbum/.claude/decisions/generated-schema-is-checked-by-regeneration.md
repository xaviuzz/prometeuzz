# Generated schema is checked by regeneration

`generate:check` regenerates `src/api/schema.d.ts` into a temp directory and compares it with the committed file; `src/api/schema.d.ts` is excluded from Biome. Why: it catches a hand-edited schema or a `openapi.yaml` copy refreshed without regenerating, with no cross-repo access.
