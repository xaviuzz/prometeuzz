# Candidates are read in parallel, capped at five

Every inspect reads its candidate addresses in parallel, each with the limits of `reading-a-page-is-bounded-and-never-fails-the-registration`, and at most 5: the origin and the 4 deepest. Why: parallel keeps the wait at one read's worth; the cap stops a deep path from firing dozens of requests at a site that is not ours. The 5 is Claude's value; revisit it with real addresses.
