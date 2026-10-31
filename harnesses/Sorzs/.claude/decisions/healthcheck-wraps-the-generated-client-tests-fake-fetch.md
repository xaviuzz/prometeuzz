# HealthCheck wraps the generated client; tests fake fetch

`HealthCheck` takes an `openapi-fetch` client and `run()` answers `ok` or `error`, never throwing. `HealthMark` gets its `HealthCheck` from `useHealthCheck()` and picks icon, label and color from a lookup keyed by checking, ok or error. Tests build the real client with a fake `fetch`, so the generated paths and parsing are exercised. Why: the API is faked at the network edge, the one place that carries no logic of ours.
