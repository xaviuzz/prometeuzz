# No fallback engine when Pele fails

The pane shows the error and the Mermaid text. Claude corrects the text and retries once, then tells Xavier in the chat.

**Why:** Mermaid.js needs a browser and another dependency; Pele covers every diagram type of Mermaid 12.1.0.
