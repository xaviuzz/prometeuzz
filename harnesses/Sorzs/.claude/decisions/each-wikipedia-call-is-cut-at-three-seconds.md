# Each Wikipedia call is cut at three seconds

Each call to Wikipedia is cut at 3 seconds, as `HttpPageReader` does, and a cut counts as no answer: the sorz goes to `failed`. Why: the searches of all sorzs run in parallel and the reply waits for the slowest, so one slow Wikipedia would hold every result. Three seconds is the bound the backend already uses for reading a page, so a second number is not invented. The constant is not shared with `HttpPageReader` yet; a third use would be the moment to extract it.
