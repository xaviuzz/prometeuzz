# Code style

Applies in every project.

- Name every intermediate result in an explaining variable (Fowler's *Introduce Explaining Variable*). A chained expression becomes one named step per line. Each operand of a predicate gets its own name too (`hasVowel`, `hasDigit`, then `isCountable`).
- Names must read one way when split into words. Say the candidate aloud as separate words (`FeelsLikeDifference` reads as "feels like difference"); if a second grouping makes sense, pick another name.
- Write iteration as an explicit loop block over a collecting variable. Reach for functional idioms (`map`, `filter`, `reduce`, chains) only where they add specific value that the loop lacks; the visual structure of the block is the default. Looking up the first match is one of those places: use `find`, not a loop that keeps the last match.
- One return per function, ending on a named result. Guard clauses are the exception: an early return or throw that rules out a case up front keeps the rest flat. Its `if` takes no block, on one line, which tells it apart from any other conditional. Where a conditional varies behavior by state or type, replace it with polymorphism (State, Strategy) before reaching for a guard clause.
- Predicates read positive: name the positive case in a variable (`isAllowed`, `hasPass`) instead of negating, and name a state by its positive side (`isOpen`, `echoing`). Guards that throw may keep the negation.
- One class per file; an error class, a helper class or a small strategy gets its own file.
- No ternary operators. Set a default value and overwrite it in an `if`; where the branch varies by state or type, use polymorphism.
- A missing value is a null object, never `null` or `undefined`: no `?.` and no `?? default` to cover absence. The empty list, the empty name, the absent title are objects that answer like the full ones. `null` appears only where a contract demands it, in the serializer.
- Private members in TypeScript use the `private` keyword, never `#`.
- A style rule Xavier states belongs here, not in a project's `decisions.md`, unless he scopes it to one project.
- Code carries no comments. Intent lives in names, small units and tests; the why of a decision goes in that project's `CLAUDE.md`.
- A rename that resolves a semantic clash covers every derived name: classes, errors, codes, contract schemas, messages, test titles. Search the old term across source, tests and contract, and keep it only where it names the other meaning. Match whole words (a word can sit inside another: `resource` holds `source`), run contents and file names as separate passes, and list the renamed paths before moving on. Escape `$` in a perl or sed replacement written in a shell line.
- A function leaves its arguments unchanged. To gather results, return a new value (an object whose methods return the next one) and reassign it in the caller's loop. A helper that writes into what it receives hides its effect from the caller.
- A public method reads as pseudocode: a sequence of calls to private methods, one per thing it handles (`readCallId`, `readBody`). Stop at that level; keep predicates and lookups inside the private method as explaining variables. A check that throws is one of those private methods (`requireWebAddress`), never inline in the public one.
- A callback passed as a prop or argument that carries a rule (a predicate, what to render) is a named function declared above the component (`hasNoAlbums`, `showAlbums`), not an inline arrow. The JSX then reads as a declaration of what shows in each state.
- A helper used by one component lives beside it. When a second consumer appears, move it up: to `domain/` if it is a type shared across the app, otherwise to the nearest folder both consumers share. A flat `lib/` is only for what is neither.
