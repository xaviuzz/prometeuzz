# Bring the stack up for manual checks

`e2e` has `up` and `down` scripts that start and stop backend and frontend without the Playwright service, and image builds use host networking. Why: trying the web against the real backend by hand needs the same composition the tests use, and the bridge network fails in this sandbox for builds as well as services.
