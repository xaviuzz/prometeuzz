# Source identity is the exact address

Two addresses are the same source only when they are equal after trimming spaces at both ends. No lowercasing, no trailing-slash or fragment rules. Why: a rule per case is added when a real case shows up (the project description says the backend decides case by case); the simplest rule that holds now is equality. Source names are compared ignoring case, because the list must not show two entries that look the same.
