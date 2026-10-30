# Flexoki light palette and type scale

Source: https://stephango.com/flexoki. Only the light end is used: paper, ink, and per hue a tint for fills (100) and the 600 tone for strokes. Hex values are literal because the Mermaid carries its own colors.

| Role | Hue | Fill (100) | Stroke (600) | Size | Weight | Marks |
|---|---|---|---|---|---|---|
| key | orange | #FED3AF | #BC5215 | 24px | bold | the one thing to look at first |
| actor | blue | #C6DDE8 | #205EA6 | 20px | bold | people, callers, entry points |
| decision | yellow | #F6E2A0 | #AD8301 | 16px | bold | choices, conditions, waiting |
| error | red | #FFCABB | #AF3029 | 16px | bold | failure, rejection, risk |
| done | green | #DDE2B2 | #66800B | 16px | normal | success, final state |
| step | base | #E6E4D9 | #6F6E69 | 14px | normal | ordinary process steps |
| data | purple | #E2D9E9 | #5E409D | 14px | italic | stores, artifacts, documents |
| info | cyan | #BFE8D9 | #24837B | 12px | normal | outputs, messages, notes |
| extra | magenta | #FCCFDA | #A02F6F | 14px | normal | a ninth role, when the eight above are used |

Size follows importance: the bigger the text, the sooner the eye lands on it. One `key` node per diagram.

Text is always ink: #100F0F. Paper is #FFFCF0.

## Class block

Paste the lines for the roles used, after the nodes:

```
classDef key fill:#FED3AF,stroke:#BC5215,color:#100F0F,font-size:24px,font-weight:700
classDef actor fill:#C6DDE8,stroke:#205EA6,color:#100F0F,font-size:20px,font-weight:700
classDef decision fill:#F6E2A0,stroke:#AD8301,color:#100F0F,font-size:16px,font-weight:700
classDef error fill:#FFCABB,stroke:#AF3029,color:#100F0F,font-size:16px,font-weight:700
classDef done fill:#DDE2B2,stroke:#66800B,color:#100F0F,font-size:16px
classDef step fill:#E6E4D9,stroke:#6F6E69,color:#100F0F,font-size:14px
classDef data fill:#E2D9E9,stroke:#5E409D,color:#100F0F,font-size:14px,font-style:italic
classDef info fill:#BFE8D9,stroke:#24837B,color:#100F0F,font-size:12px
classDef extra fill:#FCCFDA,stroke:#A02F6F,color:#100F0F,font-size:14px
```

Apply with `:::role` on a node (`A([Xavier]):::actor`) or `class A,B role`.

## Diagrams without classDef

A sequence diagram takes no `classDef`: color its steps with `rect rgb(r,g,b)` bands using the fill tints above. The font size stays fixed, so rank by emphasis: `<b>` on the key messages and participants, `<i>` on side notes.

Leave `box` out: it groups participants under one color, and Xavier rejected it. Pele draws each participant rectangle in a fixed grey, and Mermaid has no way to color one.
