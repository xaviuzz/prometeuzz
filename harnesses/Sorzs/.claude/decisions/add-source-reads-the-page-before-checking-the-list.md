# Add source reads the page before checking the list

`AddSource` reads the page for every registration, then adds to the list, so a repeated address still costs one wasted read before its refusal. There is no store of sources apart from the list, so there is nothing to reuse for a known address. Why: the case is rare with one user, and checking the address first needs a list query that takes no `Source`. Add it when the wasted read hurts. A shared store of sources arrives with the second user, together with the reuse of title and favicon.
