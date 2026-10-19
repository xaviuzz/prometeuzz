# A file is judged by its bytes

Over 25 MB is `TOO_LARGE`; what `sharp` cannot read as an image is `UNREADABLE_IMAGE`; a readable image that is not JPEG, PNG or WebP is `UNSUPPORTED_FORMAT`. The browser's type and the file name are ignored. Why: both can lie, and the bytes decide what can be shown.
