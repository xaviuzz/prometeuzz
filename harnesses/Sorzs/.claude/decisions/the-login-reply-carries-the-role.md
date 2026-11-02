# The login reply carries the role

`auth.login` answers with the token and the user's `role`. The frontend keeps the role beside the token in the same store, so a reload still knows it, and forgets both together. A stored token without a role counts as `user`. Why: the frontend must know whether to show the backoffice button, and reading the token's payload in the browser would tie the frontend to the token's format. The role only decides what is shown; it grants nothing.
