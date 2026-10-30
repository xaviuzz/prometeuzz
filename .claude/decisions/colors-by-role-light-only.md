# Diagrams color each node by role, with light Flexoki tones only

Claude gives every node a role (actor, decision, error, done...) and colors it from the table in the skill's `palette.md`: the 100 tint for fill, the 600 tone for stroke, ink for text. Role also sets font size and weight, from 12px to 24px, the largest for the one key node. No dark tones, no hex outside that file.

**Why:** the first diagrams came out almost monochrome, because Pele only colors by role when the Mermaid asks for it. Xavier wanted more graphic richness but kept the light look, so the palette is the light end of the full Flexoki set (https://stephango.com/flexoki).
