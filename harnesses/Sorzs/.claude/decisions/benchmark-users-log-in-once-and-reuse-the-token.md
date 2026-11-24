# Benchmark users log in once and reuse the token

Each virtual user of the benchmark calls `auth.login` once at the start and sends the token on every later call, as the frontend does. `auth.login` and `users.add` have their own isolated scenario, and `auth.login` weighs 1 % in the mixed one.

Why: a login costs about 170 ms of CPU (argon2id). A login per iteration would measure that cost and hide every other operation.
