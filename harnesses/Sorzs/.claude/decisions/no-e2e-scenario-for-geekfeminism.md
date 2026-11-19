# No e2e scenario for Geek Feminism

The Geek Feminism slice adds no e2e scenario and no variable to the Compose file. Why: a real wiki makes e2e depend on the network, and `e2e-covers-the-happy-path-only` asks for a reason the backend and frontend tests cannot give; they fake the wiki and show the results, the mark and the failure line. Xavier tries the real wiki by hand in the last step of the spec, as in `no-e2e-scenario-for-wikipedia`. The CLI only receives the contract copy.
