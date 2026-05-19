# v0.8 Integration Lab and Public Beta Replan

## Purpose

This note corrects the v0.8 planning posture before deeper runtime work.

IsoniaOS is moving from local demo-centric development toward a production-shaped public beta path. External tool integration is a core product requirement, not a side demo. At the same time, integration harnesses, synthetic target contracts, provider experiments, and presentation fixtures must stay isolated from the core product surface.

This is a planning document only. It does not implement runtime code, create deployments, add provider integrations, claim beta readiness, claim audit readiness, claim SaaS readiness, or make token launch a product dependency.

## Strategic Correction

v0.8 should keep the accountability and integration preview as the active implementation target, but the path to public beta needs an explicit readiness wave after the current runtime work.

The corrected sequence is:

```text
v0.8 accountability and integration preview
-> production-shaped core cleanup
-> integration lab validation on Sepolia
-> hosted dev/stage baseline
-> SaaS readiness baseline
-> ISO funding/protocol self-governance readiness baseline
-> templates baseline
-> client contract authority and managed execution review
-> security review or audit gate
-> docs and claims review
-> public beta readiness decision
```

Public beta readiness is a decision point, not a current claim.

## Why Demo-Specific Code Must Stay Out of Core

Demo-specific code is useful when it makes a scenario reproducible. It becomes risky when it enters audited or product-facing core as if it were general product behavior.

Core repositories should avoid customer-specific or demo-specific target contracts, fixtures, and shortcuts because they can:

- blur the line between product capability and presentation harness;
- expand audit scope with code that will never be used by customers;
- create false confidence about provider integrations;
- hardcode assumptions around one demo organization, one external tool, or one execution target;
- make Control Plane route/execution logic depend on examples instead of domain concepts;
- make later SaaS and self-hosted deployments harder to reason about.

The core product should model governance authority, proposal routes, accountability obligations, action metadata, and external evidence generically. Demo and integration-lab repositories may contain specific examples, seeded flows, provider experiments, mock targets, and presentation scenarios.

Client contract authority follows the same separation. Core repositories may model org-scoped managed execution, selector-level permissions, value policy, parameter constraints, and source disclosure. Specific Sepolia targets, customer ABIs, target access-control experiments, and provider workflow notes belong in integration-lab until they are deliberately promoted through reviewed generic interfaces.

## Integration Lab Source of Truth

A future or sibling `integration-lab/` repository should be the source of truth for real-world integration validation and presentation-grade scenarios.

Expected contents:

- Sepolia deployment manifests for lab contracts, demo organizations, known addresses, and network metadata;
- Snapshot testnet space workflow notes and fixtures;
- Safe Sepolia transaction proof workflow notes and fixtures;
- Tally/OpenZeppelin Governor compatibility experiment notes;
- Agora research and linking lane;
- GitHub, Discourse, and block explorer evidence fixtures;
- pinned Sepolia fork configs for reproducible read-only validation;
- presentation-ready QA scenarios;
- field notes and issue log for provider gaps, API limitations, broken assumptions, and follow-up tasks.
- Ownable-style and role-based or AccessManager/AccessManaged target validation notes for managed execution handoff.

The integration lab is not core product code. It must not pollute audited core contracts, Control Plane internals, App Core business logic, or shared domain types with demo-only behavior.

## Validation Lanes

v0.8 should distinguish three validation lanes.

### Local deterministic tests

Purpose:

- fast regression coverage;
- deterministic product behavior;
- authority and trust-boundary rendering;
- proposal/accountability/evidence lifecycle coverage.

Use for:

- seeded organizations and proposals;
- fixture-backed external resources;
- stale, missing, unsupported, and unknown provider states;
- route explanation and accountability status rendering;
- tests that must pass without external providers.

Local deterministic tests should not require Snapshot, Safe, Tally, Agora, Discourse, GitHub, block explorers, or public RPC availability.

### Pinned Sepolia forks

Purpose:

- repeatable checks against real-world chain data and known provider-adjacent formats;
- validation of transaction/event shapes without depending on live provider state during every run.

Use for:

- known Sepolia blocks and transactions;
- Safe-like transaction evidence shapes;
- Governor-like proposal and execution events;
- block explorer URL/transaction assumptions;
- regression fixtures for provider parser behavior.

Pinned forks are still not provider integration completeness. They prove that known public data can be read and interpreted consistently.

### Live Sepolia workflows

Purpose:

- real-world end-to-end smoke validation;
- provider API and UX workflow discovery;
- public demonstration that IsoniaOS can connect a decision to external evidence.

Use for:

- a lab organization or lab governance flow;
- one or more public Sepolia transactions;
- Snapshot testnet space experiments where available;
- Safe Sepolia transaction proof workflow;
- Tally/OpenZeppelin Governor compatibility experiments;
- Agora linking research where practical.

Live Sepolia workflows can fail because public providers, RPCs, testnet services, or external APIs change. They should produce field notes and issues, not replace deterministic regression coverage.

## Control Plane Integration Architecture

Control Plane should model generic proof/action metadata and provider adapters.

It should not hardcode customer/demo target contracts or provider-specific behavior into core route logic.

Preferred core concepts:

- `ExternalResource` for linked or imported external records;
- `ExternalEvidence` for proof/context attached to proposals, obligations, milestones, or actions;
- `ActionMetadata` for expected target, chain, value, calldata hash, method label, risk flags, and execution proof references;
- provider adapter boundaries for URL parsing, metadata fetch, status normalization, verification checks, and stale/error states;
- explicit authority claims, verification status, source labels, and last-sync metadata.
- org-scoped execution permission metadata covering target address, selector, value policy, calldata hash, and optional parameter constraints.

Provider adapters may know how to parse Snapshot, Safe, Tally, Agora, GitHub, Discourse, or explorer records. The core domain should continue to answer broader questions:

- What was approved?
- Who or what has authority?
- What action was expected?
- What evidence exists?
- Which source supplied the evidence?
- Is the evidence linked, imported, synced, verified, stale, missing, failed, or unknown?
- Does the evidence match the expected action metadata?

If an integration cannot verify a field, it must not silently upgrade that field to authority.

Control Plane should index IsoniaOS protocol and managed executor events as authority. It should not need to listen to every customer target contract by default. Target-contract logs may be linked as evidence or context when an adapter, importer, or integration-lab workflow supplies them.

## Evidence, Context, and Authority Boundaries

IsoniaOS must keep the following boundaries visible:

- contracts are authoritative for modeled onchain governance state;
- Control Plane read models explain and project state, but can lag or fail;
- App Core presents and explains state, but is not governance authority;
- Snapshot is authoritative for its own offchain vote records, not for IsoniaOS contract state by default;
- Safe is authoritative for Safe transaction state, not for IsoniaOS proposal approval by default;
- Tally, Agora, and Governor systems are authoritative only within their own governance source models unless explicitly mapped;
- GitHub, Discourse, and block explorers provide context or observations unless verification logic elevates a specific field;
- manual accountability updates are annotations, not protocol truth;
- templates are blueprints/configuration, not authority by themselves.

Public pages should make these distinctions visible near the affected data, not only in background documentation.

## Custom Templates Baseline

Custom organization and governance templates should be modeled as versioned configuration blueprints. They may help users create a governance structure, but they must not silently grant authority.

Template families:

- organization template;
- proposal type template;
- policy route template;
- accountability requirement template;
- external evidence requirement template;
- action metadata template;
- integration/source template.

Guardrails:

- templates cannot grant roles, permissions, execution rights, or veto rights without an explicit governed setup or activation step;
- templates must be versioned so users can see which blueprint produced a route or requirement;
- templates should be exportable and importable as data;
- risky or custom templates should display warnings before use;
- SaaS may later support private/team templates without making them part of the open-core authority layer;
- templates must not allow arbitrary code execution in core.
- templates must not silently grant target-contract owner, role, selector, value, or parameter permissions.

Managed execution permission templates may describe expected target permissions, parameter constraints, value limits, required evidence, and handoff steps. They become authority only after explicit governed setup and onchain state establish the permission.

The roadmap can support curated public templates first and user-defined templates later. Runtime implementation is not part of this docs task.

## SaaS Readiness Baseline

Managed SaaS is part of the long-term product path, but public beta must not imply full production SaaS readiness.

Before public beta readiness is claimed, the roadmap should define a baseline for:

- hosted Control Plane and App Core deployment path;
- managed Postgres and indexer infrastructure direction;
- environment separation for dev, stage, and eventually production;
- custom domain direction without claiming custom domain implementation is done;
- monitoring, logging, backups, and restore expectations;
- tenant and organization provisioning plan;
- integration credential management direction;
- open-core boundary between inspectable/self-hostable components and managed service conveniences.

This is planning/spec work unless a future implementation task explicitly scopes runtime SaaS infrastructure.

## ISO Funding and Protocol Self-Governance Readiness

ISO readiness should be integrated into public beta planning without replacing the product roadmap.

Distinctions:

- Product public beta readiness means IsoniaOS product surfaces, integrations, security gates, docs, and operating posture are ready for a public beta decision.
- ISO funding/protocol self-governance readiness means tokenomics, governance, legal, treasury, identity, risk, communications, and security/audit plans are coherent enough for an explicit future decision.
- Tokenomics simulation/readiness means economic and governance assumptions have been modeled and tested enough to inform a decision.
- Legal, security, and audit gates must be completed before any readiness claim that depends on them.
- Token launch, if any, is a separate explicit decision and is not required for v0.8 runtime work or product public beta readiness unless a future roadmap deliberately says so.

Do not claim legal readiness, audit readiness, production SaaS readiness, provider integration completeness, or token launch readiness until the relevant work exists.

## Before Public Beta

Before public beta readiness can be claimed, the project needs:

- production-shaped core cleanup across contracts, Control Plane, App Core, shared types, SDK, and docs;
- demo and mock isolation from audited/product core;
- integration lab workflows that validate external evidence and provider assumptions on Sepolia;
- hosted dev and stage environments for App Core and Control Plane;
- SaaS readiness baseline documented and partially exercised where explicitly scoped;
- ISO funding/protocol self-governance readiness baseline integrated into the public beta plan without requiring token launch;
- versioned custom template design direction;
- client contract authority model covering Ownable, AccessControl, AccessManager/AccessManaged, custom access-control, and unsupported targets;
- managed execution and parameter-constraint model review;
- security review or audit gate scoped to authority, execution, access control, integration trust boundaries, and demo/mock isolation;
- Sepolia integration-lab validation with at least one Ownable-style target and one role-based or AccessManager/AccessManaged-style target;
- docs and claims review covering product, SaaS, integrations, audit/security, legal, and ISO language;
- no unresolved claim that v0.8 is production, integration-complete, legally reviewed, audited, or token-launch ready.

See [`client-contract-authority-and-managed-execution.md`](./client-contract-authority-and-managed-execution.md) for the managed execution architecture baseline.
