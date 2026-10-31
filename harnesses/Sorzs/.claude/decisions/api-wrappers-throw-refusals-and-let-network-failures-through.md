# API wrappers throw refusals and let network failures through

`AddSource` and `ListSources` throw `CallRefusedError` (code and message) for an `error` reply and for the 400 transport error, and let a `fetch` failure reach the caller as it is. Components show `error.message` for both through `messageOf`. Why: a refusal and a failure are both something to show, and the caller has nothing to do differently, so one `catch` serves both. `HealthCheck` keeps answering `ok` or `error` without throwing because the mark only needs the state, not a message.
