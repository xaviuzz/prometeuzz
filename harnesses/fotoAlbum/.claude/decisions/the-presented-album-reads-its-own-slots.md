# The presented album reads its own slots

The presented album is built from one object and reads the slots that object carries; a catalogue album carries none and has every slot empty. Callers never pass the slots as a second argument. Why: the slots already travel inside the user album, so extracting them at each caller was asking instead of telling and repeated in every endpoint; Xavier chose this over leaving the two copies or extracting a shared helper.
