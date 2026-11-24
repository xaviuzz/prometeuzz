# Adding a user hashes the password without blocking the thread

`users.add` hashes through `Password.hashed`, which awaits `Bun.password.hash` (the worker pool). `Password.hashing`, the synchronous one, stays for the seed and for tests that build users.

Why: measured in the benchmark (50 virtual users, 2 CPUs, a `health.check` probe at 10 per second, `benchmark/k6/probe.js`). With `hashSync`, `users.add` served 4 per second and the probe waited a median of 10 s. With `hash`, it serves 8.8 per second and the probe answers in 0 ms median. `auth.login` already used the async `verify` and never blocked the probe; its ceiling of about 8 per second is the CPU of 2 cores at 170 ms per hash. Lowering the argon2id cost would raise it and is a security decision, not a speed one.

How to apply: any request path that hashes or verifies a password awaits the async call.
