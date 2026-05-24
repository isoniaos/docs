# Architecture

IsoniaOS combines contracts, indexing, projections, APIs, shared types, SDKs, App Core, integrations, and optional advisory intelligence.

The architecture exists to connect decision context, authority, execution, evidence, and memory.

## Layers

### Smart contracts

Contracts provide verifiable primitives where onchain authority is needed:

- organization configuration;
- governance bodies;
- roles and permissions;
- proposal primitives;
- approval and veto routes;
- timelocks;
- execution primitives;
- events;
- access control.

Contracts are authoritative for modeled onchain governance state.

### Control Plane

Control Plane is the indexing, projection, diagnostic, and API layer.

It should provide:

- chain event ingestion;
- raw event storage;
- idempotent processing;
- replayable projections;
- REST APIs;
- route explanation;
- governance graph generation;
- diagnostics;
- external resource modeling;
- accountability read models.

Control Plane explains and projects authority. It does not create governance authority by itself.

### Shared types and SDK

Shared types define cross-repository DTOs, enums, source labels, trust boundaries, authority claims, and provider states.

The SDK provides typed clients and helpers over Control Plane APIs without owning governance authority.

### App Core

App Core is the public self-hostable governance console.

It should provide:

- organization dashboard;
- proposal list and detail pages;
- governance structure views;
- route explanation;
- execution status views;
- public governance archive;
- accountability dashboard;
- diagnostics;
- integration evidence views;
- theme adapter.

App Core is an interaction and explanation layer. It should not contain SaaS-only billing, private tenant administration, or hidden platform authority.

### Integration layer

Integrations connect external governance tools such as Snapshot, Safe, Tally, Agora, Discourse, GitHub, block explorers, metadata standards, and attestation systems.

External records are linked evidence or context unless explicit source modeling makes a source authoritative for a specific field.

### Optional AI layer

AI may help with summaries, risk checklists, status explanations, search, and dispute summaries.

AI remains optional and advisory by default.

## Current normalization

This area is being normalized in the current workspace cycle. The current focus is production-shaped core boundaries, not public deployment claims.
