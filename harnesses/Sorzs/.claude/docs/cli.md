# Command line

## What it is

A way to use Sorzs from a terminal, as a program that stays open and answers to typed commands until the user leaves it.

## What defines it

- The place where Sorzs lives: the address of the service it talks to.
- The pass the user got when they entered (see `session.md`), if any.
- Both are kept between runs, so closing and reopening the program does not ask again.

## Rules

- The program stays open after each command and shows a prompt. Only `exit` closes it.
- The place of the service is read in this order: the setting in the environment, the saved one, and, with neither, the local development address.
- On start, if there is no saved pass, the program asks for username and password before showing the prompt. The password is not echoed. If the credentials are refused, the program says so and shows the prompt with no session; it does not ask again by itself.
- If the service cannot be reached, the program says so and shows the prompt with no session; it does not close and does not ask again by itself.
- Entering again with `login` works the same way, and it replaces any pass already kept.
- A pass kept from an earlier run is trusted until the service refuses it as forbidden. Then the program forgets it, says the user must enter again, and asks for credentials.
- `logout` forgets the pass, in the program and on disk, and says so. The service is not told (see `session.md`: it keeps nothing about sessions).
- `backend` alone shows the current place of the service and where it comes from. `backend <address>` saves a new one if it is a web address, and forgets the pass, because a pass belongs to the service that issued it.
- The password is never kept. The saved pass is readable only by its owner.
- `exit` closes the program and keeps the pass and the place.
- An unknown command says it is unknown and shows the prompt again.

## What can be done with it

- Enter, leave, see or change the place of the service, and close the program.

## Out of scope

Listing, adding or removing sources, searching, the admin role and the backoffice, help text, command history, completion, several services at once, one-shot commands outside the prompt.

## Open questions

- Which source commands come first once the base is in place?
- Should the program show who is entered in the prompt?
