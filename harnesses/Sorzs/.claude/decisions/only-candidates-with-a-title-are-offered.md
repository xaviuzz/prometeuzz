# Only candidates with a title are offered

A candidate address whose page gives no title (404, not HTML, no title) is dropped, so a candidate is an address with a title, and the list shows only with two or more candidates. Why: a candidate is identified by its title, so one without it has nothing to show, and `HttpPageReader` already returns nothing for a page that does not answer. With a single candidate the list adds nothing over the name suggestion.
