# Geek Feminism search API

Findings from trying the wiki's search before building its provider, measured on 2026-11-19 with `curl` and a `Sorzs (<contact>)` User-Agent. What Sorzs decided from them: [the decision](../decisions/geekfeminism-search-reads-the-wiki-api-and-fails-as-wikipedia-does.md).

## The API

- `https://geekfeminism.fandom.com/api.php?action=query&list=search&srsearch=<term>&srlimit=10&format=json` answers 200.
- Each hit in `query.search` carries `title`, `pageid`, `size`, `wordcount`, `timestamp` and an empty `snippet`.
- No hits give `{"query":{"search":[]}}`.

## Quirks seen

- `prop=extracts` does not exist on this wiki. There is no description to read; one page at a time would need another call each.
- `Special:Search` (HTML) answers 403 to a client that is not a browser. The provider reads the API only.
- Titles may hold `/` (`AdaCamp/AdaCampDCSessions`). A page link is `https://geekfeminism.fandom.com/wiki/<title>`, with spaces as `_`.
