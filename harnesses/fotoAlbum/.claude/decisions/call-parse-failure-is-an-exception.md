# Call parse failure is an exception

`Call.from` throws `InvalidCallError`; the operation turns it into the transport 400. Why: the failure is a boundary event, not a value the rest of the code branches on.
