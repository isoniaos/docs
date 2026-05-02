# IsoniaOS v0.5 - Design Partner Alpha Plan

Status: Planning  
Date: 2026-04-29  
Scope: Design Partner Alpha planning across the current IsoniaOS repositories

## 1. v0.5 Goal

IsoniaOS v0.5, called Design Partner Alpha, should move the project from an internal/local technical alpha to a guided external alpha.

The goal is:

```txt
A small external team can set up an organization, configure a governance topology, create proposals, and operate the proposal lifecycle through app-core with minimal help from Isonia.
```

v0.1.0-alpha proved the full technical stack:

```txt
contracts -> control-plane -> REST API -> SDK -> app-core -> theme-default
```

v0.5 should prove that this stack can be operated by a real design partner team, not only by Isonia developers using seed scripts and local demo knowledge.

For v0.5, "minimal help" means:

- the design partner can follow English setup and operator docs;
- normal setup does not require editing seed scripts;
- normal governance operation happens through App Core;
- the system explains stale data, missing indexer state, wrong wallet, wrong chain, and route blockers clearly;
- Isonia may still provide onboarding support, but should not need to manually patch databases, hand-craft transactions, or explain every proposal lifecycle step.

v0.5 remains an alpha. It is not a production governance release.

## 2. Non-goals

Do not include in v0.5 unless explicitly re-scoped:

- audited production protocol readiness;
- mainnet deployment with real assets;
- arbitrary production execution;
- Safe, Tally, Snapshot, Hats, or other external governance integrations;
- token voting;
- quadratic voting;
- reputation scoring;
- anti-Sybil or personhood systems;
- GraphQL;
- billing;
- SaaS subscription flows;
- SaaS tenant administration;
- public marketing website implementation;
- AI copilot;
- theme marketplace;
- plugin marketplace;
- production multi-chain support;
- full self-serve public signup;
- legal/compliance workflow automation;
- production incident response or key management program.

v0.5 should not move governance authority into Control Plane, SDK, App Core, SaaS, templates, metadata, or any hosted service. Contracts remain the source of authority.

AI copilot is intentionally out of v0.5 MVP, but the architecture should preserve structured governance data so AI advisory features can be added later without changing authority boundaries.

## 3. Target Users

Primary users:

- organization founder or administrator configuring the initial governance structure;
- governance operator creating proposals and moving them through the lifecycle;
- council, committee, or body member approving or vetoing proposals;
- executor operating approved proposals within the supported v0.5 execution boundary;
- external observer reviewing the governance graph, route explanation, and proposal history.

Supporting users:

- Isonia team member helping a design partner onboard;
- protocol or backend engineer diagnosing indexing and projection issues;
- frontend/support operator checking App Core runtime configuration, wallet state, and data freshness.

The design target is a small external team with enough technical literacy to use wallets and follow setup docs, but not enough context to safely use raw contract scripts as the primary product experience.

## 4. Core Workflows

v0.5 should support the following end-to-end workflows.

1. Configure environment

   A design partner or Isonia operator configures the target chain, contract addresses, Control Plane API URL, App Core runtime config, and wallet mode.

2. Create organization

   An organization administrator creates a new organization, attaches metadata, confirms the expected admin address, and verifies that the organization appears in App Core after indexing.

3. Configure governance topology

   The administrator creates bodies, roles, and mandates. App Core should make the resulting power map understandable before and after transactions are submitted.

4. Configure policy routes

   The administrator configures proposal-type routes, including required approval bodies, veto bodies, executor body, timelock, and enabled state.

5. Validate setup

   The team reviews the governance graph, role/mandate tables, and policy route previews. The system should surface route gaps such as missing approvers, missing executor mandates, disabled policy rules, and unresolved metadata.

6. Create proposal

   A proposer creates a proposal through App Core with clear metadata, proposal type, target, value, and supported execution data.

7. Operate lifecycle

   Authorized users approve, veto, queue, execute, or cancel proposals through App Core. The UI must explain which action is available, who can perform it, and why an action is blocked.

8. Verify public state

   Observers can use App Core and REST responses to inspect proposal status, policy version, route explanation, decisions, graph edges, and data freshness.

9. Diagnose indexing and projection state

   Operators can tell whether missing or stale data is caused by chain lag, indexer lag, projection backlog, failed events, wrong contract addresses, wrong chain, or expected confirmation delay.

## 5. Affected Repositories

| Repository | v0.5 planning role |
| --- | --- |
| `evm-contracts` | Confirm that existing organization, body, role, mandate, policy, and proposal lifecycle functions are sufficient for external setup; add only narrowly scoped protocol changes if setup cannot be represented safely with the existing model. |
| `types` | Own any shared DTOs, enums, blocked reason codes, diagnostics shapes, template descriptors, metadata shapes, or setup response types needed across repositories. |
| `control-plane` | Harden indexing, projections, route explanation, graph generation, and diagnostics for external operator use while keeping REST as the v0.5 API style. |
| `sdk` | Provide typed REST client coverage and viem-based protocol helpers needed by App Core setup and lifecycle flows, without becoming an authority layer. |
| `app-core` | Provide the guided external operator experience: setup flows, topology management, policy route configuration, proposal lifecycle, diagnostics, metadata display, and UX polish. |
| `theme-default` | Provide default visual support for new setup, status, diagnostic, route, and governance graph surfaces without hardcoding product-specific business logic. |
| `docs` | Maintain this plan, setup guides, operator runbooks, design partner demo scripts, API/DTO updates, and known limitations. |
| `saas` | Out of core v0.5 scope except as a boundary check. SaaS must extend App Core later, not fork it. |
| `web` | Out of core v0.5 scope. The public website is not required for Design Partner Alpha. |

## 6. Technical Scope

v0.5 technical scope should be limited to making the existing architecture usable by a design partner.

Protocol scope:

- preserve shared multi-organization deployment with `orgId` isolation;
- preserve policy rule versioning and proposal `policyVersion` snapshots;
- preserve `ProposalStatusChanged` as the lifecycle status event;
- preserve the canonical `EmergencyOperator` role type;
- review whether current creation/update functions are sufficient for partner-driven topology setup;
- avoid arbitrary production execution;
- keep execution constrained to explicitly supported alpha paths.

Shared types scope:

- add shared types before duplicating shapes locally in Control Plane, SDK, or App Core;
- keep `@isonia/types` dependency-light and free of React, NestJS, wagmi, viem, database, app, and SaaS dependencies;
- include any v0.5 route blocked reason codes, diagnostics DTOs, metadata DTOs, or template descriptors in shared types when they cross repository boundaries.

Control Plane scope:

- continue using REST, not GraphQL;
- continue using `getLogs` polling as the reliable baseline;
- keep raw event storage before projection;
- keep idempotent, replayable projections;
- expose enough read model data for setup, topology, policies, proposals, route explanation, and graph views;
- expose diagnostics for indexer, projection, configuration, and stale data states;
- never treat Control Plane as the authority for who may act.

SDK scope:

- keep `@isonia/sdk` dependent only on `@isonia/types` and allowed chain/client dependencies such as `viem`;
- provide typed path/client helpers for any new REST diagnostics or setup-read endpoints;
- provide protocol helper utilities for App Core transactions where useful;
- avoid hidden governance logic that belongs in contracts or explicit first-party domain code.

App Core scope:

- add admin/setup flows for organizations, bodies, roles, mandates, and policy routes;
- improve proposal creation and lifecycle operation;
- show route explanation, data status, wallet status, and diagnostics in product language;
- make metadata optional and resilient;
- keep self-hosted mode working without Reown Project ID through injected wallet fallback.

Docs scope:

- update specs and runbooks with every public interface change;
- clearly mark alpha limits;
- provide design partner setup and troubleshooting guidance.

## 7. Admin/Setup Flows

Admin/setup flows should be guided, reviewable, and explicit about what will be written on-chain.

Required setup flow:

1. Select or create organization

   The user enters organization metadata, confirms admin address, submits the organization transaction, waits for indexing, and sees the created organization in App Core.

2. Add bodies

   The user creates governance bodies such as council, committee, house, or emergency body. Each body should have a kind, name/metadata, and active state.

3. Add roles

   The user creates roles inside bodies. Roles should use canonical `RoleType` values and make the authority meaning clear.

4. Assign mandates

   The user assigns holders to roles with start time, end time, proposal type scope, and spending limit where relevant.

5. Configure policy routes

   The user creates policy rules for proposal types, including approvals, vetoes, executor body, timelock, and enabled state.

6. Review topology

   The user reviews a summary before relying on the organization: bodies, roles, holders, policy routes, missing authorities, and warnings.

7. Create validation proposal

   The user creates a low-risk validation proposal to verify proposer, approver, vetoer, queue, executor, and cancellation paths.

8. Operate proposal lifecycle

   The team executes the lifecycle through App Core and confirms the graph and route explanation update after indexing.

Admin flows must distinguish:

- draft configuration in the browser;
- transactions waiting for wallet signature;
- submitted transactions;
- indexed events;
- projected read model state;
- confirmed or stale data.

No setup flow may imply that draft UI state or Control Plane state is governance authority before the corresponding contract transaction exists.

## 8. Organization Templates

Organization templates should help design partners start from a recognizable governance shape. Templates are not governance authority. They are editable setup blueprints that prepare a sequence of proposed on-chain actions.

Initial template candidates:

1. Simple DAO+

   A general council, treasury committee, and security council. Suitable for a small organization that wants basic proposal approval, treasury-specific review, and emergency veto coverage.

2. Bicameral Council

   Two approval bodies with separate legitimacy bases, plus an emergency council. Suitable for testing routes that require more than one body.

3. Working Group Network

   A steering body, several working-group bodies, and scoped proposer/approver mandates. Suitable for small teams with delegated execution by function.

4. Security-Gated Operations

   A normal approval body plus a security or emergency body with veto authority and narrow emergency operator mandates.

Template requirements:

- every generated body, role, mandate, and policy rule must be visible before submission;
- templates must be editable before any transaction is sent;
- templates must produce ordinary protocol state, not hidden template-only authority;
- template labels and descriptions should become metadata where appropriate;
- a template must warn when it creates a policy route that has no eligible holder for a required action;
- templates should be documented as starting points, not governance recommendations.

Open template design should remain conservative. The goal is to reduce setup friction, not to encode Isonia's opinion as an invisible constitution.

## 9. Policy Route Configuration

Policy route configuration is central to v0.5. A design partner must be able to answer:

```txt
For this proposal type, who must approve, who can veto, who can execute, and when?
```

Required route fields:

- organization;
- proposal type;
- policy version;
- required approval bodies;
- veto-capable bodies;
- executor body;
- timelock seconds;
- enabled state.

Required route behavior:

- proposal creation must snapshot the active policy version;
- route explanation must use the proposal's stored `policyVersion`;
- missing policy snapshots must report `policy_snapshot_missing`;
- route configuration must not silently fall back to the latest policy;
- disabled policies must be visible and explainable;
- route previews must show which holders currently have mandates matching each route responsibility.

Required validation warnings:

- no required approval body selected;
- selected approval body has no active approver mandate;
- veto body has no active veto mandate;
- executor body is missing when execution is expected;
- executor body has no active executor mandate;
- timelock is set to an unexpected value;
- proposal type is not covered by the holder's proposal type mask;
- policy route was updated after existing proposals were created, so older proposals keep older policy versions.

The route builder should optimize for understanding, not only form submission.

## 10. Metadata Handling

Metadata should improve readability without becoming a governance authority layer.

v0.5 metadata principles:

- contracts store references such as metadata URI and hashes where supported;
- indexed DTOs must remain renderable with deterministic fallback labels;
- App Core must not break when metadata is missing, slow, invalid, or unavailable;
- metadata must not define who has authority;
- metadata changes must not rewrite historical proposal authority;
- mutable HTTP metadata should be clearly distinguished from content-addressed metadata such as IPFS.

Metadata should support:

- organization name and description;
- body name and description;
- role name and description;
- proposal title and description;
- external reference links;
- optional icons or logos where the theme and UI support them.

Required fallback labels:

- `Organization #id`;
- `Body #id`;
- `Role #id`;
- `Mandate #id`;
- `Proposal #id`;
- human-readable role, body, and proposal type labels from shared enums.

Metadata diagnostics should report:

- disabled metadata resolution;
- invalid URI;
- gateway timeout;
- unsupported protocol;
- content hash mismatch if a hash is expected and available;
- fallback label in use.

Metadata publishing is an open question for v0.5. Accepting an existing URL/IPFS URI is simpler than operating Isonia-hosted metadata storage, but design partners may need a guided path.

## 11. Indexer/Control Plane Diagnostics

v0.5 needs operator-grade diagnostics because design partners will not know whether stale UI data is caused by wallet state, chain state, indexing, projection, or configuration.

Required diagnostic areas:

- API health;
- API version;
- configured chain ID;
- configured RPC URL host or label;
- configured GovCore and GovProposals addresses;
- latest chain block observed;
- latest safe block after confirmations;
- last scanned block per contract;
- last indexed event time;
- raw event counts by status;
- projection backlog;
- failed projection count;
- latest projection error summary;
- stale data warnings;
- confirmation depth;
- CORS/runtime config mismatch indicators where practical;
- route explanation blockers such as `policy_snapshot_missing`.

App Core should surface diagnostics in two levels:

- user-facing status for common problems, such as "Data is still indexing" or "Wallet is on the wrong chain";
- operator-facing detail for support, such as cursor blocks, contract addresses, failed events, and projection backlog.

Control Plane should keep diagnostics REST-based for v0.5. Diagnostics must not expose sensitive secrets such as database URLs, private keys, full internal environment dumps, or privileged SaaS configuration.

The v0.5 diagnostics REST surface starts with:

```txt
GET /v1/diagnostics
GET /v1/diagnostics/indexer
```

The response is the shared `DiagnosticsDto` from `@isonia/types` and includes
API version, chain ID, configured contract addresses, latest observed and safe
blocks when RPC is available, last scanned block per contract, raw event counts,
projection backlog/failures, latest projection error summary, and stale data
indicators.

`GET /v1/diagnostics/indexer` adds runtime process heartbeat status for the API,
indexer, and projection worker, plus masked runtime configuration needed to
debug local indexing and projection.

Operational docs should explain:

- how `pnpm dev` starts the full local Control Plane runtime;
- how to run one-time indexing;
- how to run projection workers;
- how to rebuild projections;
- how to confirm the API is indexing the same contract addresses used by App Core;
- how to distinguish empty chain state from indexer failure;
- how to handle `policy_snapshot_missing`.

## 12. App Core UX Improvements

App Core v0.5 should become a usable governance console for a design partner, not only a proof that screens can read v0.1 DTOs.

Priority UX improvements:

- guided organization setup;
- topology builder for bodies, roles, and mandates;
- policy route builder with preview and warnings;
- organization template selection and editing;
- proposal creation wizard with clear proposal type, metadata, target, value, and supported execution data;
- proposal lifecycle actions with explicit eligibility, wallet requirements, route blockers, and transaction state;
- route explanation that reads as an operational checklist;
- governance graph that helps users inspect power relationships;
- proposal activity timeline from indexed decisions and status transitions;
- data freshness indicators on primary screens;
- wallet diagnostics for disconnected wallet, wrong chain, unsupported connector, missing Reown project ID, and injected fallback mode;
- normalized transaction and contract revert errors;
- empty/error/loading states for all primary workflows;
- responsive basics for design partner use on common laptop and tablet sizes.

Screens likely needed or expanded:

- `/orgs`;
- `/orgs/new`;
- `/orgs/:orgId`;
- `/orgs/:orgId/setup`;
- `/orgs/:orgId/governance`;
- `/orgs/:orgId/policies`;
- `/orgs/:orgId/proposals`;
- `/orgs/:orgId/proposals/new`;
- `/orgs/:orgId/proposals/:proposalId`;
- `/orgs/:orgId/graph`;
- diagnostics surface linked from the app shell or organization settings.

The UI must continue to respect runtime feature flags. SaaS-only routes and billing/admin features must not be built into public App Core.

## 13. Acceptance Criteria

v0.5 Design Partner Alpha is acceptable when a small external team can complete the following without Isonia manually editing scripts, databases, or UI state.

Setup acceptance:

- deploy or connect to the agreed alpha environment;
- configure App Core and Control Plane from documented values;
- create a new organization;
- attach readable organization metadata or see deterministic fallback labels;
- create bodies, roles, and mandates;
- configure at least two proposal routes with different approval/veto/timelock behavior;
- confirm the governance graph reflects the configured topology.

Proposal lifecycle acceptance:

- create a proposal through App Core;
- see the proposal's policy version and route explanation;
- approve from the required body or bodies;
- veto a proposal where the route allows veto;
- queue an approved proposal where timelock is required;
- execute a supported alpha execution path when route conditions are satisfied;
- cancel a cancellable proposal;
- see statuses update after indexing and projection.

Diagnostics acceptance:

- App Core clearly shows when data is stale or still indexing;
- Control Plane diagnostics identify chain, contract addresses, cursor position, event counts, and projection backlog;
- common configuration mistakes produce actionable messages;
- `policy_snapshot_missing` is visible and documented;
- metadata failures fall back gracefully and are diagnosable.

Quality acceptance:

- all public DTO, event, route, metadata, and diagnostics changes are represented in `@isonia/types` and docs;
- Control Plane remains REST-only;
- shared DTOs are not duplicated locally;
- App Core continues to run in self-hosted mode without Reown Project ID;
- tests cover setup projections, policy route explanation, diagnostics, SDK path/client helpers, and App Core critical flows where practical;
- documentation includes setup, demo, troubleshooting, and known limitations for design partners;
- alpha limitations are explicit before any external use.

## 14. Implementation Phases

### Phase 0 - Scope and design lock

- Confirm the exact Design Partner Alpha environment.
- Confirm whether v0.5 targets local chain, shared testnet, or both.
- Review v0.1 limitations and decide which are blockers for external use.
- Update specs for any required DTO, event, or route semantics before implementation.
- Define the minimum supported organization templates.

Exit criteria:

- v0.5 scope is written down;
- non-goals are confirmed;
- affected repository work is split into small reviewable changes.

### Phase 1 - Protocol and shared type readiness

- Audit existing contract functions against required setup flows.
- Add only necessary protocol changes, if any, to support safe external setup.
- Add or update shared types for diagnostics, metadata, setup reads, template descriptors, and route blockers where needed.
- Keep docs aligned with any shared interface changes.

Exit criteria:

- protocol and shared type surfaces are stable enough for Control Plane, SDK, and App Core work.

### Phase 2 - Control Plane and SDK hardening

- Ensure all setup and lifecycle events are decoded and projected.
- Add diagnostics read surfaces.
- Add tests for raw event, projection, policy version, and lifecycle edge cases.
- Add SDK coverage for diagnostics and any new REST paths.
- Keep replay and rebuild behavior documented.

Exit criteria:

- App Core can rely on typed REST and SDK surfaces for setup, route explanation, graph, proposals, and diagnostics.

### Phase 3 - App Core setup and lifecycle UX

- Build guided organization setup.
- Build topology management views.
- Build policy route configuration and preview.
- Improve proposal creation and lifecycle action flows.
- Add diagnostics and data freshness UI.
- Keep theme boundaries clean and self-hosted runtime config functional.

Exit criteria:

- a design partner can perform the core workflows through App Core in a controlled alpha environment.

### Phase 4 - Templates, metadata, and documentation

- Add initial organization templates.
- Finalize metadata handling and fallbacks.
- Write design partner setup guide, operator runbook, demo script, and troubleshooting guide.
- Update known limitations for v0.5.

Exit criteria:

- onboarding can be run from docs with minimal live explanation.

### Phase 5 - Design partner trial and closure

- Run the full workflow with an external design partner.
- Track friction, failed assumptions, and missing diagnostics.
- Fix only scoped blockers.
- Record closure criteria and release notes.

Exit criteria:

- v0.5 has a documented external alpha story, known limitations, and a reproducible acceptance path.

## 15. Risks and Open Questions

Risks:

- setup flows may reveal missing protocol ergonomics that cannot be solved cleanly only in App Core;
- in-app admin flows could accidentally appear more authoritative than the underlying contract transactions;
- route configuration may become too complex for a small external team without strong previews and warnings;
- metadata publishing may become a product dependency if partners cannot provide stable URIs;
- indexer lag or projection failures may be mistaken for broken governance unless diagnostics are clear;
- wallet setup remains a major source of user friction;
- template defaults may be mistaken for recommended governance constitutions;
- supporting even one external team may create operational expectations beyond alpha readiness;
- unaudited contracts limit what design partners can safely test;
- narrow execution support may disappoint teams expecting arbitrary on-chain execution.

Open questions:

- Which chain or chains are supported for Design Partner Alpha: local only, a shared testnet, or both?
- What is the minimum acceptable execution path for v0.5 beyond the current demo target, if any?
- Should metadata publishing be partner-supplied only, IPFS-assisted, or hosted by Isonia for alpha?
- Which organization templates are necessary for the first partner, and which should wait?
- Should policy route configuration support editing existing policy rules in-place, versioned replacement only, or both where the protocol allows?
- What diagnostics should be public to all observers versus visible only to operators?
- What is the required support model during the design partner trial?
- What is the explicit line between v0.5 App Core admin setup and future SaaS tenant administration?
- What must be complete before the first design partner can safely use the system with non-production authority?
- What should be considered a v0.5 blocker versus feedback for a later beta?

## 16. v0.5 MVP Cut

A design partner can create an organization from a template, review generated bodies/roles/mandates/policies, submit transactions step by step, and then operate proposal lifecycle with diagnostics.

### Must-have for v0.5 MVP

1. Organization setup wizard

   - create organization
   - metadata URI or fallback
   - wait for indexing

2. Template-based topology setup

   - Simple DAO+ template first
   - preview bodies/roles/mandates/policies
   - submit step-by-step transactions

3. Policy route builder / preview

   - at least create/set policy rules
   - show warnings before submit

4. Control Plane diagnostics

   - health/version
   - chain ID
   - configured contracts
   - latest observed/safe/scanned block
   - raw event counts
   - projection backlog/failures

5. App Core diagnostics surface

   - data freshness indicator
   - wrong chain / stale data / indexer lag messages

6. Docs

   - design partner setup guide
   - troubleshooting guide
   - v0.5 known limitations

### Should-have

- Bicameral template
- Security-Gated Operations template
- better metadata diagnostics
- proposal activity timeline

### Not yet

- Working Group Network template
- full graph visualization
- metadata publishing service
- SaaS tenant admin
- Safe integration

## 17. AI Governance Assistant — Future Direction

IsoniaOS may later include AI-assisted governance features for summarization, risk analysis, route explanation, setup assistance, and proposal review.

AI must not be treated as governance authority by default.

Any AI output is advisory unless an organization explicitly creates an on-chain or constitutionally visible rule that gives it a scoped role.

The core boundary remains:

Authority on-chain.
Intelligence off-chain.
Verification public.
