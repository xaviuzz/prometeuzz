# The CLI splits its terminal into output and input

`Terminal` is `Output` (`say`, `fail`) plus `Input` (`ask`, `askSecret`). A class takes `Output` unless it asks: only `LoginCommand`, `Prompt` and `PromptAddUserCommand` take `Terminal`. Command mode wraps only `Output`, in `MarkingOutput`, which marks each failure for the exit code. Why: command mode never asks, and most commands only write, so a wide interface forced the decorator to forward `ask` and `askSecret` it never used. Keeping one `Terminal` for all was rejected: it hides which classes can block waiting for the user.
