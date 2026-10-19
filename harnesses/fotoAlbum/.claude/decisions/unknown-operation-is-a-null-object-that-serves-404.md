# Unknown operation is a Null Object that serves 404

`OperationRegistry.find` always returns an `Operation`; an unknown name yields `NoOperation`, whose `serve` answers 404. Why: the server never branches on absence.
