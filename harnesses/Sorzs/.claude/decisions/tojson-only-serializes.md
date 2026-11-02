# toJSON only serializes

In the backend, `toJSON()` builds the shape the contract sends, and only the edge that answers a call (operations, and a class composing its parts' JSON) reads it. Anything else that needs a fact from a class asks for behavior: `SourceEntry.displayName()` and `site()`, `Source.label()`, `SourceAddress.site()`, `orElse` on the value objects that may be missing. No serialization library: the classes keep their state private, and `toJSON` is the one place that opens it, with the mapping from model to contract (flattening, `null` for a missing part) written beside the data.

Tests may assert on `toJSON()` when they check the shape the API returns; a test that only needs a fact asks for the behavior.

Why: `GoogleLinkSearch` and `SourceEntry.displayName` read `toJSON()` to get an address or a title, so a change in the contract shape would have broken rules unrelated to HTTP, and the site rule lived in infrastructure instead of with the address. A library (`class-transformer`, schema codecs, `typia`) would need access to private state or decorators in the domain, and the backend takes no extra dependency.
