# Client Contract Authority and Managed Execution

## Status

Draft / v0.8 architecture baseline.

This document is a specification and architecture note only. It does not implement Solidity, TypeScript, SDK, Control Plane, App Core, demo-stack, SaaS, or integration-lab code.

## Why this exists

IsoniaOS needs to govern real client and customer contracts without turning Isonia, the protocol, or a shared backend into an unsafe global administrator over those contracts.

Client contracts use different access-control models. Some are `Ownable`, some use OpenZeppelin `AccessControl`, some use OpenZeppelin `AccessManager` and `AccessManaged`, some use custom access-control code, and some cannot safely be handed to governance at all. v0.8 needs a production-shaped authority model that can describe these cases clearly before runtime implementation expands.

The goal is to preserve the core thesis:

```text
Authority on-chain.
Intelligence off-chain.
Verification public.
```

For client contract execution, that means authority must be per organization, explicitly scoped, publicly auditable, and backed by onchain handoff and protocol-managed execution records.

## Non-goals

This document does not:

- require every client to use an Isonia custom proxy;
- require every client to migrate to OpenZeppelin `AccessManager`;
- make Isonia, IsoniaOS, or a shared backend a global superadmin over customer contracts;
- claim that all customer contracts are governable;
- make arbitrary customer target-contract events authoritative by default;
- add provider integrations or target-contract listeners to core Control Plane requirements;
- implement call-policy enforcement, parameter constraints, executors, factories, proxies, or templates;
- claim production readiness, audit readiness, public beta readiness, SaaS readiness, legal readiness, provider integration completeness, or ISO token launch readiness.

## Core principles

- No global Isonia superadmin should be able to operate all customer contracts.
- Customer authority should be scoped per organization and backed by governance policy, deployment manifests, execution permission registries, and explicit handoff.
- Contracts are authoritative for modeled IsoniaOS protocol state.
- Client target contracts are authoritative for their own access-control state, such as owner addresses, role assignments, manager configuration, or custom permission storage.
- Control Plane indexes and explains authority; it does not create authority.
- App Core presents authority and trust boundaries; it does not create authority.
- External records, provider records, block explorer views, manual notes, and target-contract events are evidence or context unless the protocol or a reviewed adapter explicitly models a field as authority.
- Proposal action identity should use `targetAddress + value + actionSelector + dataHash`.
- Execution permission should be scoped by `orgId`, target address, selector, value policy, and optional parameter constraints.
- Free-form strings are metadata, not enforcement authority.
- Integration-lab is the place to validate Sepolia targets, provider workflows, target ABIs, and customer-like handoff examples.

## Access-control models

### Ownable / single-owner contracts

`Ownable` contracts and similar single-owner contracts have one core limitation:

```text
If the target contract has only one owner address, the target itself cannot distinguish which governance route was intended for which function.
```

The owned contract only sees the caller. If the owner is an externally owned account, multisig, timelock, or executor, the target contract does not know whether a treasury route, emergency route, protocol-upgrade route, or grants route approved the call.

For this model, IsoniaOS should split rights upstream:

- transfer ownership only after explicit customer handoff to an organization-scoped executor, timelock, Safe-like governance authority, or route-specific governed authority;
- have the upstream authority enforce selector, native value, calldata hash, and parameter policies before calling the owned contract;
- avoid giving individual users, roles, operators, or hot wallets the owner key as a normal operating model;
- record all governed calls through IsoniaOS execution events, execution receipts, and accountability records;
- disclose that the target contract enforces only its owner check while IsoniaOS enforces finer-grained governance policy before the call.

An `Ownable` target can be governable when its owner can be safely handed to an organization-scoped authority. It is not automatically fine-grained at the target-contract layer.

### AccessControl / role-based contracts

OpenZeppelin `AccessControl` and similar role-based systems can express narrower permissions than a single owner.

Preferred posture:

- grant specific roles to organization-scoped executor contracts or route-specific executors when the role maps to a meaningful governance route;
- treat `DEFAULT_ADMIN_ROLE` as highly sensitive and preferably held by a governed and timelocked organization authority, not by a hot wallet;
- make role grants, revocations, admin-role changes, and role handoffs governed actions with public records;
- model role handoff as IsoniaOS authority only when the target contract role assignment is actually onchain, verified, and linked to the organization's governed authority;
- keep role labels as metadata unless the target contract role identifier and assignment are verified.

For role-based contracts, IsoniaOS can present target roles as evidence of external authority. A role becomes part of the IsoniaOS authority model only when the protocol or a reviewed adapter explicitly records and verifies the relevant role assignment and handoff.

### AccessManager / AccessManaged contracts

OpenZeppelin `AccessManager` and `AccessManaged` style contracts are useful for new Isonia-managed templates because permission checks can be centralized by contract design.

This pattern can support:

- selector-level access rules;
- per-role delays;
- centralized permission review;
- clearer deployment manifests;
- easier public disclosure of who can call which functions.

IsoniaOS should not require existing client contracts to use this pattern. It is a strong option for future Isonia-managed templates, custom organization templates, and new client deployments that can choose audited/open access-control patterns from the start.

AccessManager-style designs still need security review before public beta claims, especially around admin handoff, emergency powers, upgrades, timelocks, and route-specific execution.

### Custom access-control contracts

Custom access-control implementations should receive no automatic authority inference.

Required posture:

- require an explicit adapter, compatibility spec, manual verification record, or reviewed deployment manifest before claiming compatibility;
- keep custom permission semantics out of generic Control Plane route logic;
- show raw execution proof and source disclosure when the system cannot verify the custom permission model;
- never infer that a custom event, custom role name, or custom ABI string grants IsoniaOS authority unless that mapping has been reviewed and modeled.

Custom target contracts can still be governed operationally if they accept calls from an organization-scoped governed authority. IsoniaOS should not claim to understand or enforce their internal permissions without a reviewed model.

### Contracts that cannot safely be governed

Some contracts should be classified as unsupported or unsafe for governed handoff until redesigned.

Examples:

- no admin or owner can be transferred;
- admin is permanently burned or unreachable;
- admin path is controlled by a third party the organization cannot govern;
- access checks depend on offchain secrets or opaque centralized services;
- upgrade path is unclear or undocumented;
- critical functions cannot be distinguished by selector or role;
- contract semantics are too custom to verify without an adapter/spec;
- handoff would give broad authority without a timelock, route review, or emergency control model.

For these contracts, IsoniaOS may show linked evidence, raw transaction proof, or manual accountability records. It should not claim governed authority.

## Proposed IsoniaOS model

### Per-organization managed executor

The baseline design should use an organization-scoped governed execution authority, such as an `IsoOrgExecutor`, timelock, Safe-like module, or route-specific executor.

The executor is not a company-wide superadmin. It is scoped to one organization or one explicitly governed authority domain. It should only execute calls approved through that organization's protocol state, policy route, and permission registry.

The executor should emit IsoniaOS protocol execution events so Control Plane can index authoritative execution state without listening to every customer target contract by default.

### Execution permission registry

Execution target and selector permissions should be an org-scoped protocol concept.

A permission registry should be able to describe:

- `orgId`;
- target contract address;
- allowed `bytes4` selector;
- allowed native value policy;
- optional parameter constraints;
- required proposal route or policy version;
- required timelock or additional approval body;
- emergency or break-glass constraints;
- source disclosure and deployment manifest reference;
- active, paused, deprecated, or revoked state.

Permission changes should themselves be governed actions. They should not be backend configuration that silently grants authority.

### Selector-level permissions

Selector-level permission is the minimum enforcement unit for target function authorization.

For v0.8 planning, a callable action should be represented by:

```text
targetAddress + value + actionSelector + dataHash
```

Where:

- `targetAddress` is the EVM target being called;
- `value` is the native token value sent with the call;
- `actionSelector` is the first four bytes of calldata;
- `dataHash` commits to the full calldata payload.

This identity is stronger than a method label and narrower than "the executor can call anything."

### Call-policy metadata

Call-policy metadata explains why a call is allowed and what constraints apply. It is not a substitute for onchain permission checks.

Future call-policy metadata may include:

- permission id;
- policy version;
- proposal type;
- route label;
- target label;
- function signature string;
- ABI source;
- risk flags;
- parameter schema;
- source disclosure;
- deployment manifest reference;
- accountable owner or body;
- evidence requirements.

Control Plane and App Core may render this metadata to help users understand a call. Enforcement should still depend on selectors, calldata/value checks, and reviewed parameter constraints.

### Parameter constraints

Parameter constraints are a future-facing managed execution concept. They should let an organization approve a selector without approving every possible calldata payload for that selector.

Examples:

- allowed selector;
- max native value;
- allowed token addresses;
- allowed recipient allowlist or denylist;
- amount limits;
- immutable parameters;
- bounded numeric ranges;
- required timelock;
- required additional approval body;
- required external evidence before execution;
- disallowed delegatecall-like behavior where applicable;
- expiry or execution window.

Parameter constraints must be typed and deterministic if they become runtime enforcement. Free-form descriptions can explain constraints, but they must not be the enforcement mechanism.

### Value limits

Native token value must be part of call identity and permission review.

The permission model should distinguish:

- no native value allowed;
- fixed native value;
- max native value;
- route-specific value cap;
- proposal-specific value commitment;
- dynamic value only when explicitly modeled and bounded.

For ERC-20 or other token transfers, amount and token-address constraints belong in typed parameter policy, not only in UI warnings.

### Emergency and break-glass controls

Emergency controls must be explicit and org-scoped.

The design should distinguish:

- pausing the executor;
- pausing a target permission;
- revoking a target permission;
- emergency cancellation;
- emergency role handoff;
- timelocked recovery;
- disclosure of who can trigger each emergency path.

Emergency powers should not create a hidden global Isonia operator. Any break-glass authority needs explicit scope, onchain state, public disclosure, and security review.

### Audit and public disclosure

Every governed client-contract call should be publicly explainable:

- which organization authorized it;
- which proposal or policy route authorized it;
- which executor called the target;
- which target and selector were called;
- what value and calldata hash were committed;
- which parameter policy applied, if any;
- what transaction executed the call;
- what evidence or target-contract logs are linked;
- which source is authoritative for each field.

This is necessary for public governance archives, accountability records, and audit-friendly review. It is not a claim that the system has completed an audit.

## Function identity and call descriptions

### bytes4 selector as enforcement identity

The `bytes4` selector is the enforcement identity for a target function.

Permission checks should use the selector derived from calldata, plus target address, value policy, calldata hash, and optional typed parameter constraints.

### human-readable function signature as metadata

A human-readable signature string, such as `transfer(address,uint256)`, is useful metadata. It helps reviewers and users understand what a selector likely means.

The string should be stored and displayed only as metadata because:

- different ABIs can describe the same selector;
- strings can be misspelled, ambiguous, or maliciously labeled;
- overloaded functions and ABI mismatches can confuse display-only tooling;
- enforcement must operate on calldata, selector, target, value, and typed constraints.

### ABI/action metadata as optional decoding support

ABI and action schema metadata can support:

- calldata decoding;
- typed parameter review;
- risk labeling;
- UI previews;
- parameter constraint validation;
- evidence matching;
- accountability records.

ABI metadata may come from deployment manifests, verified source, block explorers, integration-lab fixtures, or user-provided schemas. Source and trust boundary must be disclosed.

### why strings must not be enforcement authority

Permissions must not be enforced by free-form strings.

Use:

```text
selector: bytes4, enforcement identity
signature string: human-readable metadata, e.g. transfer(address,uint256)
ABI/action schema: optional decoding and parameter validation metadata
calldata hash: full payload commitment
```

A signature string can explain a call. It cannot authorize a call.

## Event and indexing model

### IsoniaOS protocol events are authority

Control Plane should index IsoniaOS protocol and executor events as authoritative protocol events.

Authoritative execution events should cover:

- proposal/action identity;
- organization id;
- executor address;
- target address;
- native value;
- selector;
- calldata hash;
- permission or policy reference;
- execution status;
- transaction identity.

These events let Control Plane build public archive and accountability read models from IsoniaOS state without treating arbitrary customer events as core protocol truth.

### target-contract events are evidence unless modeled otherwise

Customer target-contract events are evidence or context by default.

A target event may become authoritative for a specific modeled field only when a reviewed protocol design, adapter, or compatibility spec says so. Otherwise, App Core should display target logs as linked proof, imported evidence, or raw context with source disclosure.

### central execution events vs customer contract logs

Control Plane should not need to listen to every customer target contract as a core requirement.

Recommended baseline:

- index IsoniaOS protocol contracts and managed executor events;
- link executed transaction hashes to block explorer views;
- attach target-contract events as evidence when an adapter, importer, or integration-lab workflow supplies them;
- avoid core route logic that depends on customer-specific ABIs or events.

This keeps indexing scope bounded while preserving evidence extensibility.

### per-org executor vs singleton event hub tradeoff

A future design may use:

- per-organization executors that emit all execution events directly;
- a centralized `IsoExecutionEvents` or event hub used by multiple executors;
- route-specific executors for stronger isolation;
- Safe-like modules or timelocks that forward standardized IsoniaOS events.

Tradeoffs to review:

- event indexing simplicity;
- upgrade and migration complexity;
- blast radius of a bug;
- per-organization isolation;
- gas cost;
- deployment and manifest complexity;
- compatibility with Safe, timelocks, and AccessManager-style systems.

This remains an open design option until reviewed in the late-v0.8 hardening/security wave.

## Integration-lab validation path

Integration-lab should validate this architecture outside core product code.

Minimum useful v0.8 validation before public beta readiness can be evaluated:

- one Ownable-style Sepolia target handed to an organization-scoped governed authority;
- one role-based or AccessManager/AccessManaged-style Sepolia target with verified role or permission handoff;
- deployment manifests that disclose target, executor, owner/role/manager state, and permission assumptions;
- execution proof records linking proposal action identity to executed transaction;
- target-contract logs linked as evidence, not core authority;
- field notes for provider gaps, ABI decoding issues, and wallet/workflow friction;
- explicit unsupported-case notes for contracts that cannot be safely governed.

These tests should produce field notes, fixtures, and follow-up issues. They should not add demo-specific target assumptions to Control Plane, App Core, SDK, types, or audited contract core.

## SaaS/self-hosted implications

Managed SaaS may help customers deploy, configure, monitor, and explain managed execution, but SaaS must not become authority over customer contracts.

Self-hosted and SaaS deployments should share the same authority posture:

- governed authority is onchain and organization-scoped;
- deployment manifests and permission registries define what was handed off;
- Control Plane indexes and explains events;
- App Core presents source disclosure and accountability state;
- operators cannot silently grant target permissions outside governed setup;
- managed credentials, if any, are operational conveniences, not governance authority.

SaaS may later provide private templates, deployment workflows, monitoring, and alerting. Those features must preserve the open-core authority boundary and avoid hidden global admin paths.

## Public beta readiness gates

Before any public beta readiness claim, the project should complete a security-focused review of:

- client contract authority model;
- managed execution and executor design;
- execution permission registry;
- selector-level permission model;
- parameter-constraint model;
- value limits;
- role and ownership handoff;
- emergency and break-glass controls;
- event and indexing boundaries;
- factory/proxy assumptions, if any;
- integration-lab validation results;
- docs and public claims.

Public beta readiness should require Sepolia integration-lab validation with at least one Ownable-style target and one role-based or AccessManager/AccessManaged-style target.

The gate may recommend audited/open patterns, but it should not require all clients to use a custom Isonia proxy. Prefer clean handoff to audited/open access-control patterns first. Any factory, proxy, upgrade, or custom execution adapter pattern needs security review before beta claims.

## Open questions

- Should the first managed executor be a minimal per-org executor, a timelock, a Safe-like module, an AccessManager-compatible authority, or a combination?
- Should execution events live directly on per-org executors or be routed through a centralized event hub?
- How expressive should parameter constraints be in the first implementation wave?
- Which parameter constraints can be enforced generically without unsafe ABI assumptions?
- How should route-specific executors compare to one executor with a permission registry?
- Which role handoff proofs should Control Plane verify directly, and which should remain linked evidence?
- What is the minimal deployment manifest required for self-hosted customers?
- What factory/proxy patterns, if any, are worth supporting after security review?
- How should unmanaged or unsupported contracts be represented in App Core without implying governability?
- Which integration-lab fixtures are required before this model can enter a public beta readiness review?
