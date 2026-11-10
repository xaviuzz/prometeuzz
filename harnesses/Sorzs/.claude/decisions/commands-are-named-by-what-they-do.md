# CLI commands are named by what they do, in one word

The operations became `add`, `list`, `inspect`, `search`, `users`, `adduser`, `setrole`, `census` and `health`, not their contract names with a dot. Why: Tab completes only the first word of the line, and one word keeps it so. The last word alone clashed (`add` and `list` exist for sorzs and for users), and `sorzs` or `check` alone say nothing, so the names follow the meaning instead of the contract. `census` takes its name from the Sorzs section of the backoffice.
