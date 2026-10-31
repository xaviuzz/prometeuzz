# React and Testing Library peers arrive in the skeleton

`react`, `react-dom` and their types are installed in step 1, not step 2, because `@testing-library/react` needs them as peers and the first test renders a component to prove the environment. Biome also skips `.claude/` and `skills-lock.json` in the frontend: installed skills are not our code. Why: lint must judge only what we write.
