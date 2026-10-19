# RPC API, not REST

One `POST /<domain>.<action>` route per operation (first one: `/health.check`), described in `openapi.yaml`. Why: the API is a set of named calls with a structured message, not resources; one route per operation keeps OpenAPI and the generated client simple. Single `/rpc` endpoint with a discriminator was rejected: it moves routing into our code and forces `oneOf` in the contract.
