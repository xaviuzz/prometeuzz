# Registration refusals check the address first

`AddSource` validates the body first (`INVALID_BODY`, as in `operations-validate-inside-execute`), then refuses a repeated address with `SOURCE_ALREADY_REGISTERED`, then a repeated name with `SOURCE_NAME_TAKEN`. Both extend `CallError` and declare their code. Why: when both repeat, the address is the more telling fact (the source is already trusted), and one fixed order keeps the reply predictable for the dialog.
