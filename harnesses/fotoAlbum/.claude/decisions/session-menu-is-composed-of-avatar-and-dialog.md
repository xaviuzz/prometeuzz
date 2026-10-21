# Session menu is composed of avatar and dialog

`SessionMenu` keeps the open state and composes `SessionAvatar` (the trigger) and `RestartDialog` (the confirmation); both sit beside it in `src/components/layout/`. The dialog stays outside the `DropdownMenu`: inside it, it would unmount when the menu closes. `SessionAvatar` passes its remaining props to the button so `DropdownMenuTrigger asChild` can attach its ref and handlers. Why: the component held three concerns in 72 lines; see the layout rule in the frontend `CLAUDE.md`.
