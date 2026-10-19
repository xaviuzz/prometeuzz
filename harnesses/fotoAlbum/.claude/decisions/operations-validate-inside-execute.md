# Operations validate inside execute

An operation has one hook, `execute`, and reads and checks the body there; it has no separate `validate`. Why: four operations implemented it empty and two read the same field twice, while `answer` already turns the `InvalidBodyError` thrown by `execute` into the reply. An operation that checks both body and session reads the body first, so `INVALID_BODY` still comes before `SESSION_REQUIRED`.
