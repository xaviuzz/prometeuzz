# The CLI is a prompt that stays open

It starts, shows a prompt and answers `login`, `logout`, `backend` and `exit` until `exit`; it is not a one-shot `sorzs <command>`. Why: Xavier asked for `exit` to leave the CLI, and an open prompt asks for authorization once per run instead of once per command. Revisit if scripting from a shell is needed.
