# The stand-in result is a Google search limited to the site

Until sources give real results, each source answers with one result whose link is `https://www.google.com/search?q=<query, URL-encoded> site:<host><path>`. The site is the source's address without scheme and without final slash, path kept. Title: "Search it on Google". Description: "Google search for «query» limited to site". Why: the path stays so a source that is a path prefix (as the candidates offer) does not search the whole host, which would go beyond what the user trusts; the description tells what the link does and tells apart results that share a title.

The space before `site:` is written `%20`; the port stays; a question or fragment in the source address is dropped, since Google's `site:` takes only host and path.
