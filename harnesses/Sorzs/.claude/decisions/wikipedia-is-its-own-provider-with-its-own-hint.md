# Wikipedia is its own provider with its own hint

`SearchProviderId` gains `wikipedia`. A Wikipedia sorz is marked in the list, the collapsed side bar and the census, with the hint "Searched by Wikipedia"; the mark stays one icon for every specific provider. Why: shown as `generic` it would be a lie, and the census toggle "Only generic provider" would list a sorz that already has a better way to be searched. The frontend's census toggle reads `isSpecific()`, so the new provider class needs no change there. See `a-sorz-has-a-specific-provider-or-the-generic-one`.
