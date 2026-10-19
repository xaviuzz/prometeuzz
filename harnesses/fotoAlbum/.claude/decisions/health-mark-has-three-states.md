# Health mark has three states

Checking (neutral), ok (green ✓), error (red ✗). One check on page load, no polling; `status: error`, network failure and non-200 all count as error. shadcn is initialized but no component is generated: the mark is an icon with `role="status"`. Why: the neutral state avoids a false error flash; polling and extra components wait for a real case.
