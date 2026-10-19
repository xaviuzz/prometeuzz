# Orientation is computed before serving

The backend derives `orientation` from the album size on every reply; it is never stored or entered. Why: it follows from the size by rule, so a stored copy could drift.
