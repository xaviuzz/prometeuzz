# The session keeps the token in localStorage

`Session` stores the token in `localStorage` behind the `TokenStore` interface, under the key `sorzs.token`; tests use an in-memory store. Why: practicality. It survives a reload, needs no backend support and travels in the `Authorization` header like any other call (`the-token-travels-in-the-authorization-header`). Cookies were left out of scope.
