# Functional programming concepts covered

Depths and who raises them: `.claude/learning-projects.md`.

| Concept | Depth | Where it came up |
|---|---|---|
| Pure function: same inputs, same output, no side effects | explained | gameOfLife: `evolve` |
| Referential transparency: a call can be replaced by its value | explained | gameOfLife: `evolve("alive", 1)` is `"dead"` |
| Literal union type as a closed set of values | explained | gameOfLife: `Cell` |
| First-class function: a function is a value you name, store in a list and pass | explained | gameOfLife: `rules` |
| Function type alias (`Rule`) naming a signature | explained | gameOfLife: `Rule` |
| Higher-order function: takes or returns functions (`reduce` receives `applyRule`) | explained | gameOfLife: `evolve` |
| `reduce` (fold): combines a list into one value with an accumulator and a step function | explained | gameOfLife: `firstOpinion` |
| Combinator: builds a function from functions (`firstOpinion` turns many rules into one rule) | explained | gameOfLife: `firstOpinion` |
| Closure: an inner function remembers the arguments of the function that built it | explained | gameOfLife: `firstOpinion` |
| Thunk (`() => ...`): defers a computation until it is needed | explained | gameOfLife: `orElse` |
| `orElse`: chaining alternatives over `Option` | explained | gameOfLife: `Option` |
| `Option` (Maybe): absence as a value, `some` and `none`, instead of `null` | explained | gameOfLife: `Option`, `Rule` |
| Discriminated union: a `kind` tag the compiler narrows on | explained | gameOfLife: `Option` |
| Generic type parameter `<T>`: one definition for any value type | explained | gameOfLife: `Option<T>`, `getOrElse` |
| `getOrElse`: leaving the `Option` with a fallback | explained | gameOfLife: `evolve` |
| Immutable data: `readonly` fields and arrays, new values instead of changes | explained | gameOfLife: `Board`, `Coordinate` |
| Value type: equality by content (`sameCoordinate`), no identity | explained | gameOfLife: `Coordinate` |
| Parse, don't validate: text becomes a typed `Board` once, at the edge | explained | gameOfLife: `parseBoard` |
| `map` and `filter`: transform a list; keep the elements that pass a predicate | explained | gameOfLife: `liveColumns` |
| `flatMap`: map then flatten one level; nested `flatMap`/`map` as a cartesian product | explained | gameOfLife: `neighbours` |
| Declarative generation: describe the set of values, not the loops that build it | explained | gameOfLife: `neighbours` |
| `some`: does any element pass the predicate | seen | gameOfLife: `isAlive` |
| Inverse functions: `renderBoard` undoes `parseBoard`; round trip as a test | explained | gameOfLife: `renderBoard` |
| Total function: defined for every input, including the empty board | seen | gameOfLife: `renderBoard` |
| `pipe`: feeds a value through functions left to right; the reading order is the running order | explained | gameOfLife: `step` |
| Overloaded function type to type a variadic `pipe` | seen | gameOfLife: `Pipe` |
| Currying: a function of several arguments written as a chain of one-argument functions | explained | gameOfLife: `livesNext(board)(position)` |
| Partial application: fixing the first arguments to get a smaller function | explained | gameOfLife: `keepTheOnesThatLive(board)` |
| Point-free style: naming the steps and not the data that flows through them | explained | gameOfLife: `step` |
| `unfold` (corecursion): builds a sequence from a seed and a production step; the dual of `reduce` | explained | gameOfLife: `unfold`, `generations` |
| Generator (`function*`, `yield`, `yield*`): a function that produces values on demand | explained | gameOfLife: `unfold` |
| Lazy evaluation: a value is computed only when asked for, so a sequence can be infinite | explained | gameOfLife: `take(4, unfold(1, doubling))` |
| Structural recursion with a guard clause, instead of a loop with a mutable accumulator | explained | gameOfLife: `takeFrom` |
| `takeWhile`: cuts a lazy sequence at the first element that fails a predicate | explained | gameOfLife: `scenarios` |
| End of a computation as data, not as an exception | explained | gameOfLife: `scenarios` replaces the kata's thrown end of the world |
| Function as an immutable-data transformation: returns a new value, never mutates | seen | gameOfLife: `evolve` returns a `Cell` |
