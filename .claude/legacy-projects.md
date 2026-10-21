# Legacy projects

A project whose `CLAUDE.md` has a `## Legacy` section has three goals, held together:

1. **Catalog** the challenges the code poses.
2. **Keep delivering value** while the legacy stays in place.
3. **Evolve** the code by overcoming those challenges.

Its `CLAUDE.md` and `.claude/` live inside the project and are committed with it, even when it is a fork. It is not a harness and not a contributing project.

## Unit of work: the delta

A delta replaces the spec. Its file is `.claude/deltas/<name>.md`, in English, with:

- **Kind**: `feature` (new behavior) or `structural` (overcomes a challenge).
- **Challenges**: ids from `.claude/challenges.md` that apply, and why.
- **Docs**: the `.claude/docs/` concepts it touches.
- **Strategy**: how to reach the value with the least impact on legacy code, naming the technique.
- **Impact budget**: legacy files and lines the delta may touch. New files do not count.
- **Base**: the commit before the delta starts.
- **Steps**: `- [x]` when tests, lint and build pass, as in specs.
- `## Diagram`.

Close a delta by comparing `git diff --stat <Base>` on legacy paths with the budget. An overrun is justified in the delta or the strategy is rethought. Update the challenge's status in the catalog in the same change.

## Challenge catalog

`.claude/challenges.md`, one entry per challenge: id (`C-01`), symptom, where, evidence, risk, exit technique, status (`open`, `in delta <name>`, `overcome`). A challenge found by exploration is a proposal until Xavier confirms it.

## Techniques

Reach for these first, by name, in the delta's Strategy:

- **Feathers**, *Working Effectively with Legacy Code*: characterization tests, seams, Sprout Method/Class, Wrap Method/Class, Extract and Override, Break Out Method Object.
- **Parallel Change** (expand, migrate, contract): any change to something other code depends on.
- **Fowler's analysis patterns**: the model to converge on when the legacy concept is split or implicit.
- **Design patterns** that support the seam: Facade, Adapter, Decorator, Strategy.

## Rules

- Contain the change: new code goes in its own package; touch legacy only where the delta requires it, with the smallest diff.
- Characterize before changing: legacy behavior a delta touches is pinned by a test first, in its own step.
- The public API may change when the delta requires it. Use Parallel Change and update affected tests in a separate structural step.
- PrometeuZZ style conventions apply to new code. Legacy code a delta edits keeps its local style; a structural delta may justify more. Reformat nothing for style alone.
- Trunk-based: commit to `main`, in small steps. Branch only when Xavier asks.
- Structural and behavioral changes stay in separate steps.

## New legacy project

- `## Legacy` section in its `CLAUDE.md`, pointing here, with the baseline test command.
- `.claude/challenges.md`, `.claude/decisions.md`, `.claude/deltas/`.
- `projects.md` entry with the kind.
- A first catalog by read-only exploration, confirmed by Xavier.
