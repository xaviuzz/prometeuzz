# No e2e scenario for a wiki provider

The Wikipedia, Geek Feminism and Appropedia slices add no e2e scenario. The Wikipedia e2e step only gives the backend its `WIKIPEDIA_CONTACT`; the Geek Feminism and Appropedia ones add no variable to the Compose file, and the CLI only receives the contract copy. Why: a real wiki makes e2e depend on the network, and `e2e-covers-the-happy-path-only` asks for a reason the backend and frontend tests cannot give; they fake the wiki and show the results, the mark and the failure line. Xavier tries each real wiki by hand in the last step of its spec.
