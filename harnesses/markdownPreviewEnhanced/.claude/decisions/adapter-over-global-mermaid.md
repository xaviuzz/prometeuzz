# Adapter over the global Mermaid renderer

A script of ours, loaded after crossnote's Mermaid, replaces the global renderer's `render` with an adapter that calls Pele when Pele is the chosen engine.

**Why:** crossnote's webview finds each `div.mermaid` and calls the global `mermaid.render(id, code)`, expecting `{ svg }`. Pele's `render()` returns the same shape, so no crossnote change is needed. Changing crossnote or forking it would put the work in another repo.
