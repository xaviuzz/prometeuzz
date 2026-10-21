# Loading, error and empty states

Loading is a quiet "Cargando…" with `role="status"`. A failed call is a shadcn `Alert`; an empty catalogue and an unknown reference are a shadcn `Empty`. Why: loading must not look like an empty catalogue, and the project skill asks for these components over hand-made markup. The shared components that carry them are in [Reading states live in one ReadingView](reading-states-live-in-one-reading-view.md).
