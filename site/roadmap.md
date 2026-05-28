# Roadmap

This roadmap is public product guidance. It is directional, not a release promise and not a readiness claim. A checked item means the current public repository evidence supports that limited statement. An unchecked item means planned, partial, not yet validated, or future work.

## How To Read This Roadmap

- `[x]` means the item is supported by current repository evidence.
- `[ ]` means the item is planned, partial, or future work.
- Version bands describe product direction, not guaranteed dates.
- Later items may change as implementation and user feedback clarify the path.

## Product Throughline

The product question is:

```text
What happened after a governance decision passed?
```

The roadmap grows toward an answer that includes:

- decision records;
- route and approval context;
- execution identity and status;
- responsible party and due date;
- linked transaction or external evidence;
- source disclosure and trust boundaries;
- a durable governance memory.

## v0.1 - Product Thesis And Lifecycle Model

- [x] Document the initial idea that governance is a lifecycle, not only a vote.
- [x] Establish proposal, decision, execution, accountability, and memory as core concepts.
- [ ] Validate a complete non-technical user journey end to end.

## v0.2 - Early Organization And Proposal Model

- [x] Define organizations, proposals, roles, permissions, and activation as central product objects.
- [x] Capture the accountability loop as a product requirement.
- [ ] Make every role and permission understandable in user-facing UI.

## v0.3 - Repository Split And Shared Foundations

- [x] Split public implementation work across focused repositories.
- [x] Establish a shared TypeScript type package for cross-repository data shapes.
- [x] Keep public docs separate from implementation repositories.
- [ ] Remove all stale external links from older repository guidance.

## v0.4 - Onchain Authority And Execution Foundations

- [x] Establish EVM contract surfaces for organization state, proposal checks, roles, policy routes, and execution receipts.
- [x] Preserve the rule that contract-backed state is authoritative only for the facts it models.
- [ ] Complete broad review of authority handoff and critical execution paths.

## v0.5 - Control Plane Read Model Foundations

- [x] Establish Control Plane ownership of event ingestion, raw event storage, read models, diagnostics, and REST read APIs.
- [x] Document that read models can lag, fail, or disagree temporarily with source state.
- [ ] Harden projection rebuild and stale-data user messaging across all main views.

## v0.6 - SDK And App Core Foundations

- [x] Establish a dependency-light SDK for typed Control Plane clients and helpers.
- [x] Establish App Core as the React and Vite governance console.
- [x] Establish the default theme package as presentation-only.
- [ ] Complete all user-facing organization setup, activation, proposal, and accountability flows in a polished public beta path.

## v0.7 - Diagnostics, Evidence, Archive, And Accountability Surfaces

- [x] Add public concepts for diagnostics, evidence, archive records, accountability records, and source disclosure.
- [x] Document trust boundaries between contracts, read models, UI views, manual notes, and external records.
- [ ] Validate the full proposal-to-proof loop through current App Core and Control Plane flows.

## v0.8 And v0.8.x - Documentation, Repository Normalization, And Developer-Preview Stabilization

- [x] Preserve current public documentation around customer and user questions.
- [x] Collapse developer material into a single technical overview.
- [x] Keep public roadmap and whitepaper substantive but conservative.
- [x] Finish cross-repository normalization for contracts, shared types, Control Plane, SDK, App Core, theme behavior, and lab evidence boundaries.
- [ ] Prove the local integrated flow consistently from organization creation through evidence and accountability review.

## v0.9 - Integrated Local Candidate And User-Flow Hardening

- [ ] Provide a coherent local evaluator path for creating an organization.
- [ ] Harden activation, roles, templates, proposals, evidence, and accountability user flows.
- [ ] Improve diagnostics so stale, failed, missing, and unknown states remain visible.
- [ ] Review public docs against the current implementation before expanding claims.

## v1.0 - Public Beta Target

- [ ] Support usable organization onboarding for design partners.
- [ ] Support activation with clear required settings and visible status.
- [ ] Support role and permission review in plain language.
- [ ] Support simple templates for repeatable governance patterns.
- [ ] Support proposal, decision, execution evidence, and accountability flows.
- [ ] Keep maturity limits visible where implementation remains constrained.

## v1.x - Stabilization And UX Improvement

- [ ] Improve accessibility, empty states, error states, and mobile readability.
- [ ] Add clearer template guidance for grants, working groups, councils, and protocol operations.
- [ ] Improve public archive, accountability review, and governance memory views.
- [ ] Expand integration paths only where authority and evidence boundaries are clear.

## v2.0 - Broader Integrations And Multi-Organization Usage

- [ ] Support more mature multi-organization usage patterns.
- [ ] Improve integration with external governance, execution, discussion, and proof systems.
- [ ] Add stronger milestone tracking and post-execution review.
- [ ] Improve contributor, delegate, and working-group accountability.

## v3+ - Advanced Digital-Organization Workflows

- [ ] Support advanced governance memory and historical comparison.
- [ ] Support broader digital-organization workflows beyond early DAO use cases.
- [ ] Explore structured disputes, review histories, and organization health reporting.
- [ ] Support a larger ecosystem of extension points once the core lifecycle is stable.
