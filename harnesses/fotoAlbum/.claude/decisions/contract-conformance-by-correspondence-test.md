# Contract conformance by correspondence test

A test compares the routes in `openapi.yaml` with the registered operations, both ways. Why: no dependency, and it catches the likeliest drift (operation added without contract, or the reverse). Revisit with response validation against the schema if body shapes diverge.
