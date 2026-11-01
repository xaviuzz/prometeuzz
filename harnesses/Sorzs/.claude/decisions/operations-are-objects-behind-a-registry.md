# Operations are objects behind a registry

`Operation` is what the server serves: a `name` and `serve(Request)`. `OperationRegistry` holds the operations by name and answers `routes()`, the map the server hands to `Bun.serve`. `OperationRegistry.standard()` is where they are assembled. Why: adding an operation touches the registry and never the server.
