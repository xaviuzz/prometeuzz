# HttpPageReader delegates redirects and favicons

`HttpPageReader` only reads a page. `RedirectFollower` follows up to three redirects and returns an `Arrival`, which answers `isHtml` and `readFirstMegabyte` for its own response. `FaviconFinder` finds the icon by the rule in `reading-a-page-is-bounded-and-never-fails-the-registration`. Why: static analysis flagged the reader at cyclomatic complexity 15, from three jobs in one class and an `Arrival` record whose behavior sat in the reader (Feature Envy). Splitting brought the heaviest piece to 6.
