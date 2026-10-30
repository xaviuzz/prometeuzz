# Visual explanation

## What it is

When Xavier asks for a more visual explanation, Claude draws the answer as a diagram and shows it in a panel beside the chat. The diagram is written in Mermaid and drawn by Pele, a small open source library that turns Mermaid text into a picture.

## What defines it

- The trigger is Xavier asking for a visual explanation, a drawing or a diagram.
- The picture appears beside the chat, not inside the conversation text.
- The conversation keeps one line saying which diagram was drawn.
- The picture always uses the same look: the light Flexoki palette with an orange accent. It does not follow the editor's light or dark theme.
- The panel holds one diagram, the latest.

## Rules

- The kind of diagram (flow, sequence, state, data model...) is chosen with the existing Mermaid skill, which also writes the Mermaid text.
- A new diagram replaces the one in the panel.
- If Pele cannot draw a diagram, the panel shows the reason and the Mermaid text. Claude corrects the text and tries once more. If it fails again, Claude tells Xavier in the conversation.
- There is no second drawing engine to fall back on.
- The Mermaid text is not repeated in the conversation when the drawing works.
- If the panel is not available in the editor, the picture opens as a file in an editor tab instead.
- The picture has a size limit; a diagram too large to fit is reported as a failure like any other.

## What can be done with it

- Ask for a visual explanation of anything being discussed and see it drawn.
- Ask again and see the panel update.

## Out of scope

- A history of earlier diagrams.
- Following the editor's theme.
- Exporting the picture to PDF, HTML or images.
- Editing the diagram by hand in the panel.
- Using it outside sessions started in PrometeuZZ.

## Open questions

- Whether the part of Claude that draws the panel can run Pele inside itself, or needs a separate small program to do the drawing. Decided by a trial before building.
- The exact colors of the palette, to be checked against the Flexoki source.
- Whether the panel is available in the editor Xavier uses.
