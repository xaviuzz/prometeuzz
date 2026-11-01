# The search query is a value object

`SearchQuery` in `domain/search/` holds the query: it trims the text and refuses empty or over 200 characters with `INVALID_BODY`. The operation builds it from the body and passes it to each `SourceSearch`. Why: the rule (trim, 1 to 200) belongs to the query, not to the operation, and a primitive that carries a rule becomes a value object at first use. The same shape as `SourceName` and `SourceAddress`.
