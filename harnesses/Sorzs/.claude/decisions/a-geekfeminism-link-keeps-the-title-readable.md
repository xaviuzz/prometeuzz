# A Geek Feminism link keeps the title readable

The link of a result is `https://geekfeminism.fandom.com/wiki/<title>`: spaces become `_` and every other character is encoded except `_`, `(`, `)`, `/` and `:`. Why: the hit has a `title` and no key, so the link is built from the title as MediaWiki does. Titles hold `/` (`AdaCamp/AdaCampDCSessions`), and encoding it would turn a sub-page into a different address. The host is fixed because the provider is for this one wiki.
