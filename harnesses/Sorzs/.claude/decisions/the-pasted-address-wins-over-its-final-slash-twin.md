# The pasted address wins over its final-slash twin

A derived tramo that differs from the pasted address only by the final slash is dropped. Why: `https://a.com/x` and `https://a.com/x/` are two sources, but they almost surely give the same page and title, so offering both is noise; the pasted one is what the user wrote.
