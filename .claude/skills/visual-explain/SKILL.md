---
name: visual-explain
description: Draws the explanation as a diagram in a pane beside the chat. Use when Xavier asks for a more visual explanation, "más visual", "dibújalo", or a diagram of something just discussed.
---

Explain by drawing. The mod in this folder registers the tool `mcp__visual-explain__show_diagram`, which renders Mermaid with Pele in the Flexoki light palette and shows it in a pane.

## 1. Choose and write the Mermaid

Load `mermaid-diagrams` and follow its type chooser and syntax. Diagram the thing under discussion, nothing else. Then give every node a role and style it from `palette.md` (`classDef` block, light tones only), so hue, size and weight carry meaning: actor, decision, error, done. Use at least three roles, exactly one `key` node, and never a hex or font size outside that file. A sequence diagram takes `rect` bands instead, as `palette.md` says. Done when the Mermaid is one diagram, small enough to read at a glance, and every node has a role.

## 2. Draw it

Call `show_diagram` with `mermaid` (the source, no code fences) and `title` (one line naming what it shows). Done when the tool answers that it drew the diagram.

## 3. Fix a failure once

The tool answers an error with Pele's reason when it cannot draw. Correct the Mermaid from that reason and call again, once. Done when the second call draws, or when you tell Xavier the reason in the chat.

## 4. Say one line

Name the diagram in one line of chat. The Mermaid text stays out of the chat. Done when the reply holds that line and nothing the diagram already says.
