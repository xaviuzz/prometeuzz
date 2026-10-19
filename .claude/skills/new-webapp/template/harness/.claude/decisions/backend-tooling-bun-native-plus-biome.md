# Backend tooling: Bun native plus Biome

`Bun.serve`, `bun test`, TypeScript unbuilt; Biome is the only added dependency. No HTTP framework and no validation library: body validation is hand-written inside each operation. Why: one endpoint style and one operation do not justify them. Revisit validation at three operations.
