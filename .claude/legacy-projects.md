# Legacy projects

A project whose `CLAUDE.md` has a `## Legacy` section has three goals, held together:

1. **Catalog** the challenges the code poses.
2. **Keep delivering value** while the legacy stays in place.
3. **Evolve** the code by overcoming those challenges.

Its `CLAUDE.md` and `.claude/` live inside the project and are committed with it, even when it is a fork. It is not a harness and not a contributing project.

## Unit of work: the delta

A delta replaces the spec. Its file is `.claude/deltas/<name>.md`, in English, with:

- **Kind**: `feature` (new behavior) or `structural` (overcomes a challenge).
- **Challenges**: names of the challenges in `.claude/challenges/` that apply, and why.
- **Docs**: the `.claude/docs/` concepts it touches.
- **Strategy**: how to reach the value with the least impact on legacy code, naming the technique.
- **Impact budget**: legacy files and lines the delta may touch. New files do not count.
- **Base**: the commit before the delta starts.
- **Steps**: `- [x]` when tests, lint and build pass, as in specs.
- `## Diagram`.

Close a delta by comparing `git diff --stat <Base>` on legacy paths with the budget. An overrun is justified in the delta or the strategy is rethought. Update the challenge's status in the catalog in the same change.

## Timeline

`.claude/timeline.md` records each closed delta, in English, with the times taken from the project's commits (commit hours, not work hours). Once the delta's commits exist, add its start and end, its `gantt` bar in the day's diagram (a new diagram for a new day), its row in the summary table (delta, kind, challenge it overcomes, start, end, elapsed as end minus start) and its day in the overview `timeline`. Until then, say that the timeline is pending. The hook `work-done-needs-timeline.sh` blocks the edit that closes a delta missing from the timeline.

Close in this order: commit each green step through `commit-message`, then edit the timeline, then mark the last step `[x]`. The hook blocks the `[x]` on the last step while the delta is missing from the timeline, so "pending" holds only until that edit. Start is the delta's first commit (the plan commit); end is its last commit before the timeline commit.

## Challenge catalog

Up to three challenges, `.claude/challenges.md` holds them all. Past three it becomes an index by area, one line per challenge. Each challenge is a file in `.claude/challenges/`, named after it without a number (`global-clock.md`, title as heading); the file name is the id that deltas cite. A file holds symptom, where, evidence, risk, exit technique, status (`open`, `in delta <name>`, `overcome`). Update the status in the file and in the index together. A challenge found by exploration is a proposal until Xavier confirms it.

Measure before proposing: evidence is a number or a quote taken with a command in the session. Size counts lines of code without Javadoc; a claim about a JDK or a tool is checked on this machine. Mark a count taken with grep as approximate.

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
- A defect found during a delta and outside its scope becomes a challenge file, with the measurement taken in the session. The delta does not fix it; its Challenges section names it only if the strategy prepares its exit.

## New legacy project

- `## Legacy` section in its `CLAUDE.md`, pointing here, with the baseline test command.
- `.claude/challenges.md` with `.claude/challenges/`, `.claude/decisions.md`, `.claude/deltas/`, `.claude/timeline.md`.
- `projects.md` entry with the kind.
- A first catalog by read-only exploration, confirmed by Xavier.
