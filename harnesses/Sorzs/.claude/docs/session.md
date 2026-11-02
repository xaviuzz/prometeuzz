# Session

## What it is

The period in which a user is known to Sorzs after entering. While it lasts, the user can see and change their sources and search; without it, they can do none of that.

## What defines it

- The user it belongs to.
- A pass: a sealed token that Sorzs gives the user when they enter. Sorzs can tell that it issued it and has not been altered. The pass names the user.

## Rules

- Entering takes a username and a password. If they match the user, Sorzs gives a pass. If not, it says the credentials are not valid, without saying which of the two failed, and nothing else happens.
- Every request to Sorzs carries the pass, except entering and asking whether the service is alive.
- A request without a pass, or with a pass Sorzs did not issue or that was altered, is refused as forbidden, and nothing is done.
- A pass does not expire. It stops working only when the service's secret setup changes, which makes every earlier pass invalid.
- The browser keeps the pass, so reloading the page does not ask the user to enter again.
- When Sorzs refuses a request as forbidden, the browser forgets the pass and shows the entry screen. What the user had on screen (the list, the search) is gone from it and is read again after entering.
- The entry screen is shown, instead of Sorzs, whenever the browser has no pass.
- The entry screen shows the brand, the fields for username and password and a button to enter; pressing Enter does the same. A refusal for invalid credentials appears under the form. After being sent back by a forbidden refusal, the screen shows no message.
- The screen shows nothing of Sorzs while there is no pass: no header, no side bar, no health mark.
- Leaving forgets the pass in the browser and shows the entry screen with no message, the same way a forbidden refusal does: what the user had on screen is gone and the next user to enter sees only their own list. Sorzs keeps nothing about sessions, so a copy of the pass made earlier still works until the service's secret setup changes.

## What can be done with it

- Enter: with a username and a password, from the entry screen.
- Leave: from an icon button at the right of the header, next to the one that adds a source. It shows no text and no username; its accessible name is "Log out".

## Out of scope

Ending a pass on the service's side, expiry, renewing a pass, remembering the user across browsers, limits on failed attempts, several sessions per user as a concept.

## Open questions

- When should a pass expire, and what should the user see when it does?
- Should repeated wrong passwords slow down further attempts?
