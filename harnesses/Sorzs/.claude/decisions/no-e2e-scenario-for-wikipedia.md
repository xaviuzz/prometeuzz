# No e2e scenario for Wikipedia

The Wikipedia slice adds no e2e scenario; the e2e step only gives the backend its `WIKIPEDIA_CONTACT`. Why: a real Wikipedia makes e2e depend on the network, and `e2e-covers-the-happy-path-only` asks for a reason the backend and frontend tests cannot give; they fake Wikipedia and show the results, the mark and the failure line. Xavier tries the real Wikipedia by hand in the last step of the spec.
