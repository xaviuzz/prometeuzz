# Operations serve HTTP requests

`Operation.serve(Request): Promise<Response>`, not a Call-to-Reply call. Why: the 404 of an unknown URL is then polymorphism, and each operation owns its transport failures (400). A shared base class (Template Method) carries the common flow so operations only validate and execute.

Replaced by [Transport is separate from operations](transport-is-separate-from-operations.md).
