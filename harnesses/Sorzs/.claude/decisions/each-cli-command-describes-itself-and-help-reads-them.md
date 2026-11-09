# Each CLI command describes itself and help reads them

Every command in the registry answers the line that `help` prints for it, given the name it is registered under. `help` is built into the registry, so it lists itself and needs no wiring after the registry exists. Why: a command added without its description cannot be registered, so `help` never misses one; the name lives only in the registry key.
