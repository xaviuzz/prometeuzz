# Operations validate inside execute

An operation has one hook, `execute`, and reads and checks the body there; it has no separate `validate`. Why: operations implemented it empty or read the same field twice, while the transport already turns the `InvalidBodyError` thrown by `execute` into the reply. An operation that checks more than the body reads the body first, so `INVALID_BODY` comes before any other error.
