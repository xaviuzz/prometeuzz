# The card does nothing between pages substeps 1 and 2

In the pages step, substep 1 (structural) removes `choose` and leaves the catalogue card without an action; substep 2 gives it `userAlbum.create`. Between them the app cannot enter the making page by hand; tests stay green and nobody uses the app in between. Why: Xavier's choice; it keeps substep 1 purely structural, with no behavior mixed in.
