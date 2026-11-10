# Command mode checks the role before calling the service

A command that needs the admin role is checked against the kept pass before any call, and the pass survives a failure. Why: the service answers forbidden to a wrong role exactly as to a wrong pass, and the CLI forgets the pass on forbidden; without the check, a user running `users` would lose a good session. Command mode also lists every command in `help`, since a script has no state to filter by. The mechanism is the command's `Access` (`a-cli-command-declares-who-may-use-it`).
