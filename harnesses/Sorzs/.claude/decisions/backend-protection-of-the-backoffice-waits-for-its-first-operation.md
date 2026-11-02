# Backend protection of the backoffice waits for its first operation

The backoffice slice adds no operation, so the backend refuses nothing by role yet. The first operation that reads or changes anything for the backoffice must refuse a token whose user is not an admin as forbidden, and that slice adds the role to what `ProtectedOperation` hands on. Why: guarding an empty screen means inventing an operation just to protect it. Until then the role is a display rule, and the hiding in the browser is not security.
