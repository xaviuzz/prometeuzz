# A search reply names the sorzs that did not answer

`SorzsSearchBody` gains `failed`, the names of the sorzs that did not answer, as the list shows them, next to `results`. It is required and the reply stays a 200. Why: one sorz failing is not the search failing, so the user keeps what the others found; a refusal would lose it. Required, so a client never guesses what an absent field means. Between the contract step and the backend step that sends it nothing reads it. Optional was rejected for the same reason and for the second code path it adds in every client.
