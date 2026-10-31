# Transport is separate from operations

An operation is a handler: a `name` and `execute`, with no HTTP. A transport per body format (`JsonTransport`) reads the request into a `Call`, runs `execute`, and writes the `Reply`. `JsonOperation` pairs a handler with its transport and is what the registry holds and the server serves. Why: every operation repeated the same read, answer and failure flow and knew `Request` and `Response`. The error mapping lives in `Call.failureFrom`; the 400 for an unreadable call is `UnreadableCall`, with the message the transport gives it. A body format that is not JSON (multipart) gets its own transport and its own `*Operation` beside `JsonOperation`.

Replaces [Operations serve HTTP requests](operations-serve-http-requests.md).
