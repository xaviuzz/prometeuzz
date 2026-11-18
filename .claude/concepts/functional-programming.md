# Functional programming concepts covered

Depths, `Requires` and the gate: `.claude/knowledge-ledger.md`.

| Concept | Requires | Depth | Where it came up |
|---|---|---|---|
| Pure function: same inputs, same output, no side effects |  | applied | gameOfLife: `evolve`; TMP exercise `pure-function/invoice.ts`, written by Xavier with hints, explained in his words: no state, same input gives same output |
| Literal union type as a closed set of values |  | explained | gameOfLife: `Cell` |
| First-class function: a function is a value you name, store in a list and pass |  | explained | gameOfLife: `rules` |
| Generic type parameter `<T>`: one definition for any value type |  | explained | gameOfLife: `Option<T>`, `getOrElse` |
| Referential transparency: a call can be replaced by its value | Pure function | unseen | gameOfLife: `evolve("alive", 1)` is `"dead"` |
| Function type alias (`Rule`) naming a signature | First-class function | unseen | gameOfLife: `Rule` |
| Higher-order function: takes or returns functions (`reduce` receives `applyRule`) | First-class function | unseen | gameOfLife: `evolve` |
| `reduce` (fold): combines a list into one value with an accumulator and a step function | Higher-order function | unseen | gameOfLife: `firstOpinion` |
| Combinator: builds a function from functions (`firstOpinion` turns many rules into one rule) | Higher-order function | unseen | gameOfLife: `firstOpinion` |
| Closure: an inner function remembers the arguments of the function that built it | First-class function | unseen | gameOfLife: `firstOpinion` |
| Thunk (`() => ...`): defers a computation until it is needed | First-class function, Closure | unseen | gameOfLife: `orElse` |
| `orElse`: chaining alternatives over `Option` | Option, Thunk | unseen | gameOfLife: `Option` |
| `Option` (Maybe): absence as a value, `some` and `none`, instead of `null` | Discriminated union, Generic type parameter | unseen | gameOfLife: `Option`, `Rule` |
| Discriminated union: a `kind` tag the compiler narrows on | Literal union type | unseen | gameOfLife: `Option` |
| `getOrElse`: leaving the `Option` with a fallback | Option | unseen | gameOfLife: `evolve` |
| Immutable data: `readonly` fields and arrays, new values instead of changes | Pure function | unseen | gameOfLife: `Board`, `Coordinate` |
| Value type: equality by content (`sameCoordinate`), no identity | Immutable data | unseen | gameOfLife: `Coordinate` |
| Parse, don't validate: text becomes a typed `Board` once, at the edge | Value type | unseen | gameOfLife: `parseBoard` |
| `map` and `filter`: transform a list; keep the elements that pass a predicate | Higher-order function | unseen | gameOfLife: `liveColumns` |
| `flatMap`: map then flatten one level; nested `flatMap`/`map` as a cartesian product | `map` and `filter` | unseen | gameOfLife: `neighbours` |
| Declarative generation: describe the set of values, not the loops that build it | `flatMap` | unseen | gameOfLife: `neighbours` |
| `some`: does any element pass the predicate | Higher-order function | unseen | gameOfLife: `isAlive` |
| Inverse functions: `renderBoard` undoes `parseBoard`; round trip as a test | Pure function, Parse, don't validate | unseen | gameOfLife: `renderBoard` |
| Total function: defined for every input, including the empty board | Pure function | unseen | gameOfLife: `renderBoard` |
| `pipe`: feeds a value through functions left to right; the reading order is the running order | Higher-order function | unseen | gameOfLife: `step` |
| Overloaded function type to type a variadic `pipe` | `pipe`, Function type alias | unseen | gameOfLife: `Pipe` |
| Currying: a function of several arguments written as a chain of one-argument functions | Closure, Higher-order function | unseen | gameOfLife: `livesNext(board)(position)` |
| Partial application: fixing the first arguments to get a smaller function | Currying | unseen | gameOfLife: `keepTheOnesThatLive(board)` |
| Point-free style: naming the steps and not the data that flows through them | `pipe`, Partial application | unseen | gameOfLife: `step` |
| `unfold` (corecursion): builds a sequence from a seed and a production step; the dual of `reduce` | `reduce`, Generator | unseen | gameOfLife: `unfold`, `generations` |
| Generator (`function*`, `yield`, `yield*`): a function that produces values on demand | Thunk | unseen | gameOfLife: `unfold` |
| Lazy evaluation: a value is computed only when asked for, so a sequence can be infinite | Thunk, Generator | unseen | gameOfLife: `take(4, unfold(1, doubling))` |
| Structural recursion with a guard clause, instead of a loop with a mutable accumulator | Pure function | unseen | gameOfLife: `takeFrom` |
| `takeWhile`: cuts a lazy sequence at the first element that fails a predicate | Lazy evaluation, `map` and `filter` | unseen | gameOfLife: `scenarios` |
| End of a computation as data, not as an exception | Option, Total function | unseen | gameOfLife: `scenarios` replaces the kata's thrown end of the world |
| Function as an immutable-data transformation: returns a new value, never mutates | Pure function, Immutable data | unseen | gameOfLife: `evolve` returns a `Cell` |
