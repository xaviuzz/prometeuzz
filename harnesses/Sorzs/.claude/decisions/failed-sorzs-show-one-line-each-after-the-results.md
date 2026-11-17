# Failed sorzs show one line each after the results

The frontend and the CLI show one line per sorz in `failed`, after all the results, in list order. Why: the results are what the user came for and must not move or be interleaved with failures; one line per sorz keeps each name, which a single summary banner would lose. A sorz that did not answer is not an error of the search, so it does not use the alert of a failed search.
