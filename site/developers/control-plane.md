# Control Plane

Control Plane is the indexing, projection, diagnostics, and read API layer for IsoniaOS.

## Responsibilities

- ingest contract events;
- store raw event data where needed;
- build replayable projections;
- expose read APIs;
- normalize external evidence;
- track stale, error, failed, unsupported, and unknown states;
- explain routes and status;
- report diagnostics.

## Boundary

Control Plane is not governance authority by default.

It explains and projects contract state, external evidence, and annotations. If a future design gives Control Plane authority over a specific field or action, that authority must be explicitly modeled, documented, and reviewed.

## Implementation expectations

Projection logic should be idempotent and replay-safe. Provider adapters should live at integration boundaries and should not leak provider-specific assumptions into core governance semantics.
