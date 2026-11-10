# Frontend and CLI stay on TypeScript 5

The frontend and the CLI pin `typescript@^5` while the backend runs 7.x. Why: `openapi-typescript` 7.13 peers on `typescript ^5` and calls its JavaScript API (`ts.factory`), which the native 7.x compiler does not expose. Revisit when `openapi-typescript` supports 7.x.
