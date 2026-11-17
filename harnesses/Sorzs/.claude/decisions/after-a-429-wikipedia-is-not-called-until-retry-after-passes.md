# After a 429 Wikipedia is not called until Retry-After passes

On a 429 the sorz fails, and the provider makes no call to that language site until the `Retry-After` seconds pass, 60 when the header is absent. The wait is kept in memory per language site: another language is unaffected and a restart forgets it. Why: Wikipedia asks programs to slow down when it says so, and a call during the wait would only be refused again. Memory only, because the providers are built once per process and a stale wait after a restart costs one refused call, not a store to maintain.
