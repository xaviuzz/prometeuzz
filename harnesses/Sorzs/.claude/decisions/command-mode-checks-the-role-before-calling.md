# Command mode checks the role before calling the service

A command that needs the admin role is checked against the kept pass before any call, and the pass survives a failure. Why: the service answers forbidden to a wrong role exactly as to a wrong pass, and the CLI forgets the pass on forbidden; without the check, a user running `users` would lose a good session. Command mode also lists every command in `help`, since a script has no state to filter by.

`adduser` in command mode takes the password in the line, by Xavier's choice, over an environment variable; the prompt mode asks for it without echo so the history never holds it. The shell's history can hold it in command mode; that is accepted.
