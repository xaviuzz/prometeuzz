# Page parts live in their own components

`HomePage` and `MakingPage` only load data and compose; what they show for each state lives in `Catalogue`, `AlbumRow`, `AlbumMaking` and `AlbumCharacteristics` under `src/components/`, each with its own test. Page tests keep the first level: the title, the heading, the reference asked, the way back. Why: private parts inside a page cannot be tested on their own, and the layout rule asks for the child's content to belong to the child's test.
