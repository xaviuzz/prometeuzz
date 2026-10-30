# The skill hands the diagram over through a tool the mod registers

The mod registers `show_diagram`; Claude calls it with the Mermaid text and a one-line title. Nothing is written to a watched file.

**Why:** a mod cannot watch files, and a call returns Pele's error to Claude so it can correct the text.
