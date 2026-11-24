# Benchmark users log in once and reuse the token

Each virtual user of the benchmark calls `auth.login` once at the start and sends the token on every later call, as the frontend does. `auth.login` and `users.add` have their own isolated scenario, and `auth.login` weighs 1 % in the mixed one.

Why: `Password.hashing` calls `Bun.password.hashSync`, which blocks the only thread for the length of the hash. A login per iteration would measure that block and hide the cost of every other operation.
