# Health mark has three states

Checking (neutral), ok (green ✓), error (red ✗). One check on page load, no polling; `status: error`, network failure and non-200 all count as error. The mark is an icon with `role="status"`, not a shadcn component. Why: the neutral state avoids a false error flash; polling and a heavier component wait for a real case.
