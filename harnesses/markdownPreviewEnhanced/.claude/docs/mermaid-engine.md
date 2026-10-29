# Mermaid engine

## What it is

The part of the preview that turns a diagram written in Mermaid syntax into the picture the reader sees. Today one engine does it (Mermaid). This adds a second one (Pele, a small open source library by the Obsidian team that reads the same syntax and draws an SVG), chosen by the user.

## What defines it

- The input is always the same: the text inside a Mermaid code block of the document.
- The output is always a picture shown in place of the block.
- Exactly one engine is chosen at a time for the whole preview. The default is Mermaid, so nobody changes behavior without asking for it.

## Rules

- With Pele chosen, every diagram is drawn by Pele first.
- If Pele cannot draw a diagram, that diagram alone is drawn by Mermaid. The rest of the document keeps using Pele.
- If Mermaid also fails, the reader sees the same error as today.
- With Pele chosen, the Mermaid theme and Mermaid configuration settings have no effect. The documentation says so.
- Pele takes its colors and fonts from the editor's current theme, so a switch between light and dark changes the diagrams without reloading the preview.
- Nothing about how crossnote (the rendering library the extension wraps) works is changed.

## What can be done with it

- Choose the engine in the extension settings.
- Compare how both engines draw the same document.
- Read any diagram type Pele supports (it declares all those of Mermaid 12.1.0).

## Out of scope

- Exporting diagrams to HTML, PDF or image with Pele.
- The web version of the extension.
- Translating Mermaid themes or configuration into Pele styling.
- Sending the change upstream. This is a personal experiment; an upstream proposal needs an issue and the maintainer's agreement first.

## Open questions

- Which of the editor's theme colors map to each color Pele lets us style.
- Whether Pele draws on the first try for the diagram types the document set actually uses.
- Whether Pele needs a browser environment to draw, which decides how far it can be tested outside the editor.
