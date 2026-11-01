# Candidates are read in parallel, capped at five

Every inspect reads its tramos in parallel with the limits of one read (3 seconds, 1 MB, 3 redirects), and at most 5 tramos: the origin and the 4 deepest. Why: parallel keeps the wait at one read's worth; the cap stops a deep path from firing dozens of requests at a site that is not ours. The 5 is Claude's value; revisit it with real addresses.
