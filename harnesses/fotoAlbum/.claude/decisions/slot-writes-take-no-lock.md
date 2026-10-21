# Slot writes take no lock

`slot.place` and `slot.empty` read the user album, change it and write it back with no lock, so two simultaneous calls of one session end with the last write. Why: the app has one person and one page open per session, so the race does not happen in use; a lock would add machinery for nothing. Revisit if a session ever has several writers.
