# Command line

## What it is

A way to use Sorzs from a terminal, in two modes: a program that stays open and answers to typed commands until the user leaves it (for people), and a single command given when the program is started, which runs and ends (for scripts and agents).

## What defines it

- The place where Sorzs lives: the address of the service it talks to.
- The pass the user got when they entered (see `session.md`), if any.
- Both are kept between runs, so closing and reopening the program does not ask again.

## Rules

- Started with nothing after its name, the program is in prompt mode. Started with a command after its name, it is in command mode: it runs that one command and ends. The next two lists say what each mode does.
- In both modes, a failure (unknown command, refused credentials, service unreachable, forbidden pass, address that is not a web address) is written to the error output, never to the normal one.

## Rules in command mode

- It never asks anything: no username, no password, no prompt, no remembered lines, no Tab.
- Every command works except `exit`, which exists only in prompt mode; there it counts as unknown.
- `login` takes the username and the password from the environment, never from the line. If either is missing it fails and says which.
- A command that needs a session fails, saying the user must enter with `login`, when no pass is kept or the service refuses it as forbidden. A refused pass is forgotten, as in prompt mode.
- A command that needs the admin role fails, saying so, when the kept pass is a user's. This is checked before calling the service, and the pass is kept: the service answers forbidden to a wrong role as to a wrong pass, and the user's pass is still good.
- `help` lists every command except `exit`, whatever the pass.
- Results are written to the normal output and errors to the error output. The program ends with 0 when the command worked and 1 when it failed, for any reason.
- `help`, `--help` and `-h` list the commands the mode has, each written as it is typed in a shell (`sorzs backend <address>`), without `exit`, and say that `login` reads the username and password from the environment. An unknown command shows the same list and fails.

## Rules in prompt mode

- The program stays open after each command and shows a prompt. Only `exit` closes it.
- With a session, the prompt names who is entered and their role: the username, `@sorzs`, and a symbol for the role, 👑 for admin and 👤 for user (`xaviuzz@sorzs 👑> `). With no session it is plain `sorzs> `. It changes as soon as the user enters or leaves.
- The username is the one typed when entering and is kept with the pass. A pass kept before usernames were kept shows the prompt without the username (`sorzs 👤> `) until the user enters again.
- The place of the service is read in this order: the setting in the environment, the saved one, and, with neither, the local development address.
- On start, if there is no saved pass, the program asks for username and password before showing the prompt. The password is not echoed. If the credentials are refused, the program says so and shows the prompt with no session; it does not ask again by itself.
- If the service cannot be reached, the program says so and shows the prompt with no session; it does not close and does not ask again by itself.
- Entering again with `login` works the same way, and it replaces any pass already kept.
- A pass kept from an earlier run is trusted until the service refuses it as forbidden. Then the program forgets it, says the user must enter again, and asks for credentials.
- `logout` forgets the pass, in the program and on disk, and says so. The service is not told (see `session.md`: it keeps nothing about sessions).
- `backend` alone shows the current place of the service and where it comes from. `backend <address>` saves a new one if it is a web address, and forgets the pass, because a pass belongs to the service that issued it.
- The password is never kept. The saved pass is readable only by its owner.
- `exit` closes the program and keeps the pass and the place.
- `help` lists the commands the user can use now (see "Commands and who may use them"), one line each: its name, its argument if it takes one, and what it does. It lists itself. The list changes as soon as the user enters or leaves.
- An unknown command, or one the user cannot use now, says it is unknown and shows the prompt again; the service is not called.
- Pressing Tab completes the name of a command, the first word of the line, from the commands the user can use now, `help` included. With one match it completes the name and adds a space. With several it completes what they share and, on a second Tab, lists them. A command added later is completed with no further work.
- Tab completes nothing after the first word, and nothing while a password is typed.
- The program remembers every line typed at the prompt, unknown commands included, and keeps them between runs. The username and the password asked when entering are never remembered; the line `login` is.
- A blank line is not remembered, nor is a line equal to the one just before it. Only the last 500 lines are kept.
- A line is kept as soon as it is typed, so closing the program abruptly loses nothing.
- The up arrow brings back the previous line, starting from the most recent, and the down arrow goes forward again. It works the same in a new run as in the one where the line was typed, and not while a username or a password is typed.
- The remembered lines are readable only by their owner.

## Commands and who may use them

Each command is named by what it does, in one word. Each says who may use it: anyone, a user with a session, or an admin. In prompt mode the program offers only what the user may use now, in `help`, in Tab and as a known name; in command mode see above.

| Command | Does | Who |
|---|---|---|
| `help` | lists the commands | anyone |
| `login` | enters; replaces any kept pass | anyone |
| `backend` | shows or sets the place of the service | anyone |
| `health` | asks whether the service is alive; writes `ok` | anyone |
| `exit` | closes the program (prompt mode only) | anyone |
| `logout` | forgets the pass | a session |
| `add <address> [name]` | adds a source to the user's list; the rest of the line after the address is the name; writes `added` and the entry's label | a session |
| `list` | writes `<label>  <address>` per entry in order of addition, or `no sources yet` | a session |
| `inspect <address>` | writes `title: …`, `favicon: …` and one `<address>  <title>` line per candidate; an absent value is empty | a session |
| `search <query>` | the rest of the line is the query; writes `<title>  <url>  (<source>)` per result, or `no results` | a session |
| `users` | writes `<username>  <role>`, oldest first | admin |
| `adduser <username> [role]` | adds a user, role `user` by default; writes `added <username> as <role>` | admin |
| `setrole <username> <admin or user>` | writes `<username> is now <role>` | admin |
| `census` | writes `<users>  <address>` per source in use, in the service's order | admin |

- The label of an entry is its name, else the title of its source, else its address (see `source-list.md`).
- A missing required argument fails with a line of usage (`usage: add <address> [name]`) and changes nothing.
- A refusal by the service (source or name taken, username taken, the last admin) is written to the error output with the service's message.
- In prompt mode `adduser` asks for the password without echo and never remembers it. In command mode the password is part of the line: `adduser <username> <password> [role]`, and the shell's own history will hold it.
- The role is that of the pass, known since the user entered. If an admin was made a user elsewhere, the service refuses the next admin command as forbidden; the pass is forgotten as for any forbidden refusal, and the user enters again.

## What can be done with it

- Enter, leave, see or change the place of the service, list the commands, complete a command name with Tab, bring back earlier lines with the arrows, and close the program.
- Use every operation the service has (see the table), each by the role that may.

## Out of scope

Removing or renaming sources, removing or renaming users, changing passwords, help for a single command, searching the history, completing arguments, several services at once, JSON output, several commands in one run.

## Open questions

None.
