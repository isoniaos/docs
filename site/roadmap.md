# IsoniaOS Roadmap

The public roadmap describes active and upcoming product direction. It is not a historical backlog.

## Roadmap principles

- Keep the first public focus on accountable DAO and Web3 governance.
- Treat governance as a lifecycle from proposal to memory.
- Keep contracts authoritative for modeled onchain governance state.
- Keep Control Plane and App Core as explanatory and operational layers unless authority is explicitly modeled.
- Keep external records labeled as evidence or context unless a specific field is modeled as authoritative.
- Keep AI advisory by default.
- Use Git history and tags for old versions instead of active archive folders.

## Current focus

### Public docs reset

The public docs repository is being reset into a current MkDocs site for IsoniaOS-only documentation. The site keeps the whitepaper, roadmap, authority model, trust boundaries, product docs, developer docs, operator docs, and ReadTheDocs configuration.

### Protocol normalization

The EVM contracts repository should separate core protocol behavior from demos, mocks, and validation harnesses. Contract docs should define authority, lifecycle events, permissions, execution semantics, and deployment posture.

### Shared types

Shared types should model governance state, evidence, action metadata, provider status, authority claims, stale/error states, and cross-repository API contracts without leaking demo-only assumptions into product surfaces.

### Control Plane

Control Plane should index events, build replayable projections, expose read APIs, normalize external evidence, and surface diagnostics. It must not become governance authority by default.

### SDK

The SDK should expose typed clients and helpers for IsoniaOS contracts, Control Plane APIs, and shared data models. It should avoid UI, provider, and demo-specific assumptions.

### App Core

App Core should provide the self-hostable governance console: public archive, proposal views, route explanation, execution/accountability status, diagnostics, and integration evidence views. It should stay separate from private operator workflows.

### Theme Default

The default theme should provide replaceable presentation tokens and components without governance logic.

### Integration Lab

Integration Lab should validate external provider behavior, public testnet workflows, provider quirks, field notes, and evidence fixtures outside core repositories.

## Product direction

Near-term product work focuses on:

- proposal lifecycle records;
- execution obligations;
- responsible parties and due dates;
- linked transaction and evidence records;
- manual accountability annotations;
- stale, failed, missing, unsupported, and unknown states;
- public governance archive;
- source labels and trust-boundary warnings.

Later work may add deeper provider adapters, verification logic, templates, advisory AI summaries, governance memory search, milestone review, dispute workflows, and broader digital-organization use cases.

## Readiness gates

Public claims depend on scoped evidence gates. Security review, integration validation, hosted environment posture, provider coverage, legal/compliance posture, and launch-related decisions must be evaluated separately before related claims are made.
