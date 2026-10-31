# Routes are a map handed to Bun.serve

`OperationRegistry.routes()` answers one `POST` route per operation, under `/<name>`. `Server` hands that map to the `routes` option of `Bun.serve`, and its `fetch` is only the 404 for whatever no route took. Why: the server then holds no dispatch of its own, and a new kind of route (a `GET` resource) joins as one more registry whose `routes()` is spread beside the operations'. `routes` is part of Bun, so it adds no dependency; Hono, Elysia, itty-router and `URLPattern` routers were weighed and added a dependency for the same dispatch. A method with no handler on a known path falls to `fetch`, so it answers 404, not 405. `Operation` does not declare its method: every operation is a `POST` (RPC API), and the first non-POST operation is the moment to add it.

Replaces [Unknown operation is a Null Object that serves 404](unknown-operation-is-a-null-object-that-serves-404.md): `find` and `NoOperation` are gone.
