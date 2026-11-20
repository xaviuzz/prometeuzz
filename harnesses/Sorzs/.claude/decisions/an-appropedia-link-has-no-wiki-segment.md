# An Appropedia link has no wiki segment

The link of a result is `https://www.appropedia.org/<title>`: spaces become `_` and every other character is encoded except `_`, `(`, `)`, `/` and `:`. Why: Appropedia serves articles from the root, not under `/wiki/` as Geek Feminism does, and the hit carries a `title` and no key, so the link is built from the title as MediaWiki does. Titles hold `/` (`Community_action/Join`) and encoding it would turn a sub-page into a different address. The encoding rule is the one of `a-geekfeminism-link-keeps-the-title-readable`; only the base differs.
