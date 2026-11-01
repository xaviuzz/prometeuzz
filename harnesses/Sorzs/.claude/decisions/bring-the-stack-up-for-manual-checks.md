# Bring the stack up for manual checks

`e2e` has `up` and `down` scripts that start and stop backend and frontend without the Playwright service. Why: trying the web against the real backend by hand needs the same composition the tests use. Networking is as in `e2e-compose-uses-host-networking`.
