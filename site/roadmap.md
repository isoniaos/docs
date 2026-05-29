# Roadmap

**Document version:** v0.1.0
**Date:** 2026-05-29

This roadmap is public product guidance. It is directional, not a release
promise and not a readiness claim. A checked item means current public
repository evidence supports that limited statement. An unchecked item means
planned, partial, not yet validated, or future work.

## How To Read This Roadmap

- `[x]` means the item is supported by current repository evidence.
- `[ ]` means the item is planned, partial, or future work.
- Version bands describe product direction, not guaranteed dates.
- Provider names describe intended integration sequencing, not current support.
- Later items may change as implementation, evidence, and user feedback clarify
  the path.

## Product Throughline

IsoniaOS is growing toward this product direction:

```text
Governance control plane
+ accountable self-management
+ external adapter ecosystem
+ AI-assisted memory
```

The core question remains:

```text
What happened after a governance decision passed?
```

The roadmap expands that question into a broader organization lifecycle:

- purpose, roles, circles, policies, and decision modes;
- tensions, advice process, consent process, proposals, and votes;
- decisions, execution, evidence, and accountability records;
- external records with source disclosure and trust boundaries;
- discussion context with consent, redaction, retention, and deletion rules;
- AI-assisted summaries, memory, and facilitation that do not become authority.

IsoniaOS should connect existing tools without pretending they all carry the
same authority. A Safe execution, Snapshot vote, Governor proposal, DAO
framework record, chat discussion, forum post, manual note, and AI summary each
mean different things. The product should show those differences clearly.

## Integration Maturity Labels

Integration work should use explicit maturity labels.

| Label | Meaning |
| --- | --- |
| Planned | Directional target. No support claim. |
| Research | Provider model, APIs, limits, and trust boundaries are being studied. |
| Lab-only | Evidence or experiments exist outside product authority. |
| Read-only preview | Selected records can be linked or imported for context or evidence. |
| Evidence-linked | Imported records include source, timestamp, freshness, and boundary labels. |
| Authority-aware | Adapter behavior preserves the provider authority model and known limits. |
| Controlled write | The product may initiate scoped writes only after explicit gates. |

No provider should be described as production-supported, complete, audit-ready,
or public-beta-ready unless a scoped evidence gate supports that specific claim.

## Explicit Integration Order

The intended order is:

1. Provider/source registry, maturity labels, and trust-boundary model.
2. Safe read-only execution and evidence.
3. Snapshot read-only offchain signal.
4. Tally and Agora read-only Governor/governance records.
5. Aragon and DAOHaus read-only DAO-framework records.
6. Colony read-only organization-runtime research and adapter.
7. XDAO read-only multi-chain treasury/runtime research and adapter.
8. Discussion ingestion: Forums / Discourse-style platforms first, then
   Discord, Telegram, Slack, and other popular platforms.
9. AI-assisted memory and facilitation over structured records.
10. Controlled write integrations, with Safe first and organization-runtime
    writes last.

This sequence keeps execution evidence ahead of broad governance aggregation,
keeps offchain signal separate from execution authority, treats full
organization runtimes as deeper semantic mappings, and defers writes until
read-only adapters prove their authority boundaries.

## v0.1 - Product Thesis And Lifecycle Model

- [x] Document the initial idea that governance is a lifecycle, not only a
  vote.
- [x] Establish proposal, decision, execution, accountability, and memory as
  core concepts.
- [x] Validate a complete non-technical user journey end to end.

## v0.2 - Early Organization And Proposal Model

- [x] Define organizations, proposals, roles, permissions, and activation as
  central product objects.
- [x] Capture the accountability loop as a product requirement.
- [x] Make every role and permission understandable in user-facing UI.

## v0.3 - Repository Split And Shared Foundations

- [x] Split public implementation work across focused repositories.
- [x] Establish a shared TypeScript type package for cross-repository data
  shapes.
- [x] Keep public docs separate from implementation repositories.
- [x] Remove all stale external links from older repository guidance.

## v0.4 - Onchain Authority And Execution Foundations

- [x] Establish EVM contract surfaces for organization state, proposal checks,
  roles, policy routes, and execution receipts.
- [x] Preserve the rule that contract-backed state is authoritative only for
  the facts it models.
- [x] Complete broad review of authority handoff and critical execution paths.

## v0.5 - Control Plane Read Model Foundations

- [x] Establish Control Plane ownership of event ingestion, raw event storage,
  read models, diagnostics, and REST read APIs.
- [x] Document that read models can lag, fail, or disagree temporarily with
  source state.
- [x] Harden projection rebuild and stale-data user messaging across all main
  views.

## v0.6 - SDK And App Core Foundations

- [x] Establish a dependency-light SDK for typed Control Plane clients and
  helpers.
- [x] Establish App Core as the React and Vite governance console.
- [x] Establish the default theme package as presentation-only.
- [x] Complete all user-facing organization setup, activation, proposal, and
  accountability flows in a polished public beta path.

## v0.7 - Diagnostics, Evidence, Archive, And Accountability Surfaces

- [x] Add public concepts for diagnostics, evidence, archive records,
  accountability records, and source disclosure.
- [x] Document trust boundaries between contracts, read models, UI views,
  manual notes, and external records.
- [x] Validate the full proposal-to-proof loop through current App Core and
  Control Plane flows.

## v0.8 And v0.8.x - Documentation, Repository Normalization, And Developer-Preview Stabilization

- [x] Preserve current public documentation around customer and user questions.
- [x] Collapse developer material into a single technical overview.
- [x] Keep public roadmap, litepaper, and whitepaper substantive but
  conservative.
- [x] Finish cross-repository normalization for contracts, shared types,
  Control Plane, SDK, App Core, theme behavior, and lab evidence boundaries.
- [ ] Prove the local integrated flow consistently from organization creation
  through evidence and accountability review.

## v0.9 - Adapter Foundation

- [ ] Define a provider/source registry for external records.
- [ ] Add maturity labels, source disclosure, freshness, and trust-boundary
  fields to the adapter model.
- [ ] Keep external records as context or evidence unless a scoped product model
  gives them authority.
- [ ] Establish deterministic adapter tests before any provider support claim.
- [ ] Keep integration-lab evidence separate from core product authority.

## v1.0 - Public Beta Core Target

- [ ] Support usable organization onboarding for design partners.
- [ ] Support activation with clear required settings and visible status.
- [ ] Support role and permission review in plain language.
- [ ] Support simple templates for repeatable governance patterns.
- [ ] Support proposal, decision, execution evidence, and accountability flows.
- [ ] Keep maturity limits visible where implementation remains constrained.

This is a target band, not a claim that public beta readiness exists today.

## v1.1 - Self-Management Primitives And Safe Read-Only Evidence

- [ ] Add clearer product primitives for purpose, circles, roles, policies, and
  scoped authority.
- [ ] Represent execution proof and accountability without requiring automatic
  execution.
- [ ] Research and build Safe read-only evidence paths for multisig execution
  context.
- [ ] Show Safe source, transaction, threshold context where available, signer
  context where available, freshness, and verification limits.
- [ ] Avoid treating Safe execution as proof that the original governance
  decision was valid unless the governing process is linked and modeled.

## v1.2 - Tensions, Advice, Consent, And Snapshot Read-Only Signal

- [ ] Add tension records as the start of work, review, change, or conflict.
- [ ] Add advice-process and consent-process concepts for decisions that should
  not be forced into a vote.
- [ ] Research and build Snapshot read-only adapter behavior for offchain
  proposal and voting signal.
- [ ] Keep Snapshot results separate from execution authority.
- [ ] Show source, proposal identity, vote context, timestamp, freshness, and
  known limits.

## v1.3 - Tally And Agora Read-Only Governor/Governance Adapters

- [ ] Research Governor-style proposal, voting, delegation, and execution-state
  records.
- [ ] Build read-only adapter paths for Tally records where evidence gates
  support them.
- [ ] Build read-only adapter paths for Agora records where evidence gates
  support them.
- [ ] Normalize only the fields that can preserve source semantics.
- [ ] Keep provider-specific status, missing data, stale data, and indexing
  limits visible.

## v1.4 - Aragon And DAOHaus Read-Only DAO-Framework Adapters

- [ ] Research DAO-framework records for organization setup, permissions,
  proposals, treasury activity, and execution context.
- [ ] Build read-only adapter paths for Aragon records where evidence gates
  support them.
- [ ] Build read-only adapter paths for DAOHaus records where evidence gates
  support them.
- [ ] Preserve the distinction between framework authority, chain authority,
  external evidence, and IsoniaOS records.
- [ ] Avoid implying migration away from existing DAO frameworks.

## v1.5 - Colony Read-Only Organization-Runtime Research And Spec

- [ ] Research organization-runtime concepts such as domains, teams, motions,
  permissions, payments, work records, disputes, and contribution signals.
- [ ] Specify a read-only Colony adapter mapping before product claims.
- [ ] Map external runtime records into IsoniaOS only where source semantics are
  clear.
- [ ] Treat contribution or reputation-like data as contextual signals, not
  universal rank.
- [ ] Defer write behavior until later authority, legal, security, and UX gates.

## v2.0 - Multi-Organization Usage And XDAO Research/Spec

- [ ] Support more mature multi-organization usage patterns.
- [ ] Improve organization switching, comparison, archive review, and
  cross-organization memory.
- [ ] Research XDAO multi-chain treasury, organization, and runtime records.
- [ ] Specify read-only XDAO adapter behavior before any support claim.
- [ ] Keep multi-chain evidence source-disclosed and freshness-labeled.

## v2.1 - Discussion Ingestion

- [ ] Add discussion-source records linked to tensions, proposals, decisions,
  accountability records, and evidence.
- [ ] Start with Forums / Discourse-style platforms where public thread URLs
  and permissions are clearer.
- [ ] Add Discord ingestion only with source disclosure, consent, retention,
  deletion, redaction, and permission boundaries.
- [ ] Add Telegram ingestion only with source disclosure, consent, retention,
  deletion, redaction, and permission boundaries.
- [ ] Add Slack and other popular platforms only after the same privacy and
  governance boundaries are explicit.
- [ ] Treat discussion sources as context, not automatic authority.

## v2.2 - AI-Assisted Memory And Facilitation

- [ ] Add AI-assisted summaries over structured records where source grounding
  is visible.
- [ ] Support tension extraction, missing-evidence prompts, accountability
  follow-up detection, and decision-mode suggestions as advisory features.
- [ ] Label AI output as assistance, not proof, authority, legal advice, or final
  judgment.
- [ ] Allow organizations to disable AI-assisted features where appropriate.
- [ ] Avoid using private or restricted content without explicit permission and
  documented handling rules.

## v2.3 - Budgets, Payments, Contribution Signals, And Organization Health

- [ ] Connect budgets and payments to circles, roles, policies, decisions,
  execution evidence, and accountability records.
- [ ] Represent contribution signals as contextual, source-disclosed, and
  reviewable.
- [ ] Add organization health views for unresolved decisions, blocked work,
  missing evidence, overdue accountability, and stale integrations.
- [ ] Keep financial, work, and reputation-like signals bounded by privacy,
  consent, and source-quality limits.

## v2.4 - Stabilized Read-Only Integration Ecosystem

- [ ] Stabilize read-only adapter behavior across Safe, Snapshot, Tally, Agora,
  Aragon, DAOHaus, Colony, XDAO, discussion platforms, and other popular
  platforms where evidence gates support it.
- [ ] Provide consistent stale, failed, permissioned, missing, and unknown states
  across adapters.
- [ ] Document adapter maturity and trust boundaries in product and developer
  surfaces.
- [ ] Avoid provider-completeness claims unless a provider-specific evidence
  gate is met.

## v3.0 - Controlled Write Integrations

- [ ] Introduce controlled write integrations only after read-only adapters,
  authority boundaries, tests, security review, and UX safeguards are in place.
- [ ] Start with tightly scoped Safe write paths where the organization
  explicitly configures the authority and the user sees the execution boundary.
- [ ] Keep Snapshot, Governor, DAO-framework, organization-runtime, and
  discussion-platform writes behind later explicit gates.
- [ ] Preserve user review, wallet confirmation, audit trail, rollback or
  cancellation expectations, and failure disclosure.
- [ ] Treat organization-runtime writes as last because their semantic and
  authority mappings are deeper.

## v3+ - Advanced Digital-Organization Workflows

- [ ] Support advanced governance memory and historical comparison.
- [ ] Support broader digital-organization workflows beyond early DAO use cases.
- [ ] Explore structured disputes, review histories, appeals, and organization
  health reporting.
- [ ] Support richer extension points once the core lifecycle and read-only
  adapter ecosystem are stable.
- [ ] Explore advanced automation only where authority, consent, safety, and
  review gates are explicit.

## Provider Mapping Summary

| Provider or source | Initial role in IsoniaOS | First intended maturity |
| --- | --- | --- |
| Safe | Multisig execution and evidence source | Read-only evidence |
| Snapshot | Offchain voting and signal source | Read-only preview |
| Tally | Governor-style proposal and governance record source | Read-only preview |
| Agora | Governance portal and proposal record source | Read-only preview |
| Aragon | DAO-framework organization, permission, proposal, and treasury context | Research to read-only preview |
| DAOHaus | DAO-framework records and treasury/governance context | Research to read-only preview |
| Colony | Organization-runtime records, work, payments, and contribution context | Research/spec first |
| XDAO | Multi-chain treasury and organization-runtime context | Research/spec first |
| Forums / Discourse-style platforms | Public discussion context | Read-only discussion source |
| Discord | Community discussion context | Permissioned discussion source |
| Telegram | Community discussion context | Permissioned discussion source |
| Slack | Team or working-group discussion context | Permissioned discussion source |
| Other popular platforms | Additional governance, discussion, work, or evidence records | Planned per-source review |

This table is a map of intended sequencing. It is not a support matrix.

## Acceptance Gates

Before any integration moves to a stronger maturity label, the project should
have evidence for the relevant scope:

- source identity, URL or external ID model, and data ownership are understood;
- authority boundary is documented in user-facing language;
- stale, failed, permissioned, missing, and unknown states are represented;
- privacy, consent, deletion, retention, and redaction rules are addressed for
  discussion or private sources;
- deterministic tests or fixture-backed tests cover provider-independent logic;
- lab evidence records provider-specific assumptions and observed behavior;
- UI labels do not imply unsupported authority or completeness;
- security review scope is defined before controlled write behavior;
- public docs avoid production, audit, public beta, provider-completeness,
  legal, SaaS, token-launch, or AI-governance readiness claims.

## Non-Goals

For the current roadmap, IsoniaOS does not claim to:

- replace every DAO, treasury, voting, discussion, or organization-runtime tool;
- provide production-ready provider integrations;
- provide audit-ready controlled execution;
- make external records authoritative by default;
- make AI a governor, voter, judge, executor, or final decision maker;
- ingest private discussions without consent, source disclosure, redaction,
  retention, and deletion boundaries;
- provide tokenomics, ISO token launch, legal launch, SaaS launch, or public
  beta readiness through this roadmap.
