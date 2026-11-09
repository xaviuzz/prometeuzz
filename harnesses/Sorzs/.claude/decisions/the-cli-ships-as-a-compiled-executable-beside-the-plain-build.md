# The CLI ships as a compiled executable beside the plain build

`build:bin` compiles the program into one executable, `dist/sorzs`, with Bun's own `--compile`; `install:bin` copies it to `~/.local/bin/sorzs`. `build` keeps writing `dist/main.js`. Why: the executable runs from any folder without bun or `node_modules`, and needs no new dependency. It is a separate script because the compiled file weighs about 70 MB and the gates that run `build` do not need it.
