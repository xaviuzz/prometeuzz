# Adapter tested with fakes, webview tried by hand

The adapter is a small class that takes the chosen engine and the code and returns `{ svg }`, falling back to Mermaid. Mocha tests drive it with a fake Pele and a fake Mermaid. The real webview is tried by Xavier, and its step is marked done only after he confirms.

**Why:** the existing mocha suite runs in Node with a VS Code stub and has no browser. Fakes pin the fallback rules, which are the logic; the drawing itself is Pele's job.
