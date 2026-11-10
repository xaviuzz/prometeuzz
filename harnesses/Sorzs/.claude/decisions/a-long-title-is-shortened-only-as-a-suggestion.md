# A long title is shortened only as a suggestion

The add dialog shortens the page title to at most 60 characters before suggesting it as the name: at the last separator past the 30th character, else at the last space with `…`, else hard at 59 with `…`. The sorz keeps its title whole (up to 200). Why: the name limit (60) is a rule of the user's list, not of the sorz; a title longer than 60 made the suggestion fail on submit with "name must have between 1 and 60 characters". The 30-character floor is Xavier's "past a certain position", value chosen by Claude; revisit it with real titles.
