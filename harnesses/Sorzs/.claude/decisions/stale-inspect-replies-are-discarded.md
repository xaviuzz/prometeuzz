# Stale inspect replies are discarded

When the user changes the address while an inspect is in flight, its reply is dropped and no spinner is shown; a failure stays silent. Why: with several reads per inspect the wait is longer, and an old reply must not replace the list or the name for an address the user has left; silence matches the existing rule that an inspect failure never blocks adding.
