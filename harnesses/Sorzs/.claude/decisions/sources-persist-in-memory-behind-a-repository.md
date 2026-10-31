# Sources persist in memory behind a repository

The source list lives in memory in `infrastructure/`, behind an interface the domain defines. Reloading the page keeps the list; restarting the backend empties it. Why: the slice asks only that a reload shows the list, and a file or database would add a dependency and a deploy concern before any slice needs them. Real persistence is its own slice and replaces the implementation, not the interface.
