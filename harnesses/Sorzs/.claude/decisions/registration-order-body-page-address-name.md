# Registration order: body, page, address, name

`AddSource` validates the body first (`INVALID_BODY`, as in `operations-validate-inside-execute`), then reads the page, then adds to the list, which refuses a repeated address with `SOURCE_ALREADY_REGISTERED` and then a repeated name with `SOURCE_NAME_TAKEN`. Both extend `CallError` and declare their code.

Why: when both repeat, the address is the more telling fact (the source is already trusted), and one fixed order keeps the reply predictable for the dialog. The page is read for every registration, so a repeated address still costs one wasted read before its refusal: the case is rare with two trusted users, and checking the address first needs a list query that takes no `Source`. Add that query when the wasted read hurts. A shared store of sources, with the reuse of title and favicon, is still open (`docs/source.md`).
