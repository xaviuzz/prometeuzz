# The repository is told what was added

The sorz list repository has `load()` and `add(entry)`. The operation loads the list, lets the list accept the entry (which applies the rules), then tells the repository to add that entry. There is no `save(list)`.

Why: a repository that receives the whole list must guess what changed, and counting rows only works while the list is add-only. The domain already knows what happened, so it tells the repository (tell, don't ask). Renaming and removing will each arrive as their own method, with nothing to compare.
