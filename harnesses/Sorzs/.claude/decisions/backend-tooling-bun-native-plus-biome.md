# Backend tooling: Bun native plus Biome

`Bun.serve`, `bun test`, TypeScript unbuilt; Biome is the only added dependency. No HTTP framework and no validation library: the body is read with `Body.requireText` and `Body.optionalText`, and the rules of each value live in the domain. Why: four operations read three fields between them, and nothing is validated twice. Revisit validation when a body carries a field `Body` cannot read, such as a number, a list or a nested object.
