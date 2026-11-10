# The CLI is Bun native with no prompt library

Bun, `bun test`, Biome and `tsc --noEmit`, as in `backend-tooling-bun-native-plus-biome`. Prompts use `node:readline` and the password is read with echo off. The only runtime dependency is `openapi-fetch`. It pins a copy of `openapi.yaml` and generates its client like the frontend (`generated-client-openapi-typescript-and-openapi-fetch`). Why: the stack matches the other repos, a prompt library is not needed for a line prompt, and the pinned contract catches drift with `generate:check`. Any other dependency is asked first.
