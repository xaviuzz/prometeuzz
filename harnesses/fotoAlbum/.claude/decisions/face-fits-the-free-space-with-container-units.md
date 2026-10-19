# The face fits the free space with container units

The face area is a size container, and the face takes `min(100cqw, 100cqh × page proportion)` as its width, with `aspect-ratio` for its height. Why: fixing the height and capping the width with `max-w-full` stretches the face as soon as the cap bites; the container units keep the proportion whichever side limits it. Happy-dom computes no layout, so only a by-hand check proves the fit.
