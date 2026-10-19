# The making page has one route

The making page is `/confeccion`, with no reference. With a user album every address leads there; with none, `/confeccion` leads to the catalogue, and an old `/confeccion/<reference>` leads to `/confeccion`. The "Álbum no encontrado" state is gone. Why: the reference in the address no longer decides anything, since the session's user album does.
