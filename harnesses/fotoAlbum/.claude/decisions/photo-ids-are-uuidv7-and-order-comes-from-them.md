# Photo ids are UUIDv7 and order comes from them

Ids come from `Bun.randomUUIDv7()` and the list is the session folder's entries in sorted order. Files of one upload are stored one after another in the order chosen. Why: UUIDv7 is a UUID that sorts by creation time, so "oldest first" needs no index file and no reliance on file times.
