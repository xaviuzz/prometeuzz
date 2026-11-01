# Only candidates with a title are offered

A tramo whose page gives no title (404, not HTML, no title) is not a candidate, and the list shows only with two or more candidates. Why: a candidate is identified by its title, so one without it has nothing to show, and `HttpPageReader` already returns nothing for a page that does not answer. With a single candidate the list adds nothing over the name suggestion.
