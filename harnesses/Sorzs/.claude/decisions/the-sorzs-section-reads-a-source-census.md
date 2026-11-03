# The Sorzs section reads a SourceCensus

One operation, `sorzs.sources`, requires admin and answers `{ sources: [{ address, favicon, users }] }`, already ordered; `favicon` is null only in the contract. In the domain, `SourceCensus` groups the entries of every user by source, counts distinct users and orders by address ignoring case. Why: the section is a resource of its own, as `users.*` is, and the frontend only paints. Ordering in the frontend was rejected: the order is a rule of the census, tested once. Pagination was left out: the number of sources of two users does not need it.
