# The source list repository hands over every owner's entries

`SourceListRepository` gains a read of the entries of all owners; `SourceCensus` does the grouping, counting and ordering. `SqliteSourceListRepository` only reads, and `InMemorySourceListRepository` hands over what it holds. Why: the rule lives in the domain and is tested with the in-memory repository, with no SQL; both stores differ only in where the entries are kept, as with `Roster` for users. A GROUP BY in SQLite was rejected: the in-memory store would lack the rule and the count would drift between stores.
