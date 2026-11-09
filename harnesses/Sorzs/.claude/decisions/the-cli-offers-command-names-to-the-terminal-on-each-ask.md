# The CLI offers command names to the terminal on each ask

The prompt hands the terminal the registry's names every time it asks for a command, and the terminal completes the first word with Tab from them. Why: the terminal is built before the registry (the registry needs it to speak), so giving the names at construction would be a circular wiring; passing them per ask keeps the terminal free of the registry and leaves credential questions with no names to complete. A command added to the registry is completed with no further change.
