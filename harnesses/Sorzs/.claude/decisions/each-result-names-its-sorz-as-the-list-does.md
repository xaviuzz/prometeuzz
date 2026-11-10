# Each result names its sorz as the list does

A result's `sorz` is the display name of the list entry: the user's name, else the page title, else the address. `SorzEntry` gives it (`displayName`), so the backend and the frontend's list apply the same rule in two places. Why: the result is built in the backend and must read like the list the user sees. If the rule changes, change both; when the search moves to the frontend module, the duplicate goes away.
