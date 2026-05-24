# Control Plane

Control Plane is the indexing, projection, diagnostic, and API layer.

## Responsibilities

Control Plane should:

- ingest chain events;
- preserve raw events;
- process idempotently;
- build replayable projections;
- expose REST APIs;
- explain routes and governance state;
- model external resources and evidence;
- expose accountability read models;
- report diagnostics and stale states.

## Boundary

Control Plane is not the source of governance authority by itself.

It explains and projects contract state and explicitly modeled external records. It can lag, fail, be rebuilt, or become stale.

## Integration posture

Control Plane should use provider adapters at the edge for Snapshot, Safe, Tally, Agora, GitHub, Discourse, block explorers, and other sources.

Core route and accountability logic should not hardcode customer/demo target contracts.

## Current status

This area is being normalized around generic proof/action metadata, external resource records, provider adapters, and diagnostics.
