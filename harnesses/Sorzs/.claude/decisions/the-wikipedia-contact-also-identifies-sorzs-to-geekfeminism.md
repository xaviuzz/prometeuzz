# The Wikipedia contact also identifies Sorzs to Geek Feminism

The Geek Feminism call sends `Sorzs (<contact>)` with the value of `WIKIPEDIA_CONTACT`, which keeps its name. In the code the fetch and the contact lose the name Wikipedia (`WebFetch`, `contact`), because two providers use them. Why: a second variable for the same person is configuration nobody asked for, and renaming the variable would break every deployment for a word. See `the-wikipedia-contact-is-a-required-variable`; the rename of the variable is open if a third site needs one.
