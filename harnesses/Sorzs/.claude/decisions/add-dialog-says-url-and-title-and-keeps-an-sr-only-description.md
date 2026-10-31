# The add dialog says URL and Title and keeps an sr-only description

The fields read URL and Title. Code, contract and docs keep address and name: only the visible words changed. The description under the title is `sr-only`, not removed, so a screen reader still announces it while the screen shows only the title and the fields. Why: Xavier asked for the short labels and no visible description. Open: the Title field sends the source's name, which is not the page title the backend reads; if the two meanings clash, rename the label.
