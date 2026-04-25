# IsoniaOS v0.1 — Protocol Spec

Status: Draft for implementation  
Scope: EVM Solidity contracts for private prototype  
Product: IsoniaOS  
Company: Isonia

---

## 1. Purpose

The protocol layer is the on-chain source of truth for IsoniaOS v0.1.

It must prove that one shared EVM deployment can support many independent organizations, each with its own governance structure, bodies, roles, mandates, policies, and proposal lifecycle.

The goal is not to build a full DAO voting system in v0.1. The goal is to implement a minimal constitutional governance core.

---

## 2. Non-goals for v0.1

Do not implement in v0.1:

- token voting;
- quadratic voting;
- anti-Sybil;
- reputation scoring;
- arbitrary unrestricted executor;
- upgradeable proxies;
- multi-chain protocol deployment;
- complex on-chain DSL;
- plugin marketplace;
- production Safe/Tally/Hats integrations.

---

## 3. Contract topology

Recommended v0.1 topology:

```text
GovCore      — organizations, bodies, roles, mandates, policy rules
GovProposals — proposal lifecycle, approvals, vetoes, queue, demo execution
DemoTarget   — controlled demo execution target
```

`GovCore` and `GovProposals` are protocol contracts.  
`DemoTarget` is only for prototype/demo scenarios.

---

## 4. Global design principles

### 4.1 Shared protocol, many organizations

The protocol MUST support many organizations in one shared deployment.

All organization-specific entities MUST include `orgId`:

- bodies;
- roles;
- mandates;
- policy rules;
- proposals;
- decisions.

### 4.2 Tenant isolation

No action in one organization may affect another organization.

Any function that mutates organization-scoped data MUST validate `orgId` ownership of all referenced entities.

### 4.3 On-chain source of truth

Contracts are the source of truth for:

- organization existence and status;
- governance bodies;
- roles;
- active/revoked mandates;
- policy rules;
- proposal lifecycle;
- approvals;
- vetoes;
- queue and execution status.

### 4.4 Event-first design

Every critical state transition MUST emit an event sufficient for off-chain indexing.

The control plane should not need to constantly call heavy getters to reconstruct history.

### 4.5 Minimal external dependencies

Protocol code should rely on minimal, well-known dependencies only. Avoid unnecessary inherited frameworks or complex abstractions.

Acceptable for v0.1:

- first-party Solidity code;
- optionally small, audited OpenZeppelin primitives if clearly justified.

Avoid in v0.1:

- upgradeability libraries;
- large permission frameworks;
- external governance frameworks as core dependency.

---

## 5. Solidity conventions

Recommended:

- Solidity `^0.8.24` or newer stable `0.8.x`;
- custom errors instead of long revert strings;
- explicit access checks;
- event for every critical transition;
- no proxy upgradeability in v0.1;
- no arbitrary external execution except controlled demo target flow;
- use `uint64` for timestamps where reasonable;
- use compact enums/flags where reasonable;
- store long text off-chain via URI/hash.

---

## 6. Enums

### 6.1 OrganizationStatus

```solidity
enum OrganizationStatus {
    None,
    Active,
    Paused,
    Archived
}
```

Rules:

- `None` means non-existent.
- `Active` organizations can create/update governance objects and proposals.
- `Paused` organizations should not create new proposals or mutate governance topology, except admin-level status recovery if allowed.
- `Archived` organizations are read-only for v0.1.

### 6.2 BodyKind

```solidity
enum BodyKind {
    Unknown,
    GeneralCouncil,
    TreasuryCommittee,
    SecurityCouncil,
    CapitalHouse,
    MeritHouse,
    EmergencyCouncil,
    Custom
}
```

### 6.3 RoleType

```solidity
enum RoleType {
    Unknown,
    OrgAdmin,
    BodyAdmin,
    Proposer,
    Approver,
    Vetoer,
    Executor,
    EmergencyOperator
}
```

### 6.4 ProposalType

```solidity
enum ProposalType {
    Unknown,
    Standard,
    Treasury,
    Upgrade,
    Emergency
}
```

### 6.5 ProposalStatus

```solidity
enum ProposalStatus {
    None,
    Created,
    UnderReview,
    Approved,
    Queued,
    Vetoed,
    Executed,
    Cancelled,
    Expired
}
```

### 6.6 DecisionType

```solidity
enum DecisionType {
    Unknown,
    Approve,
    Veto
}
```

---

## 7. Structs

### 7.1 Organization

```solidity
struct Organization {
    uint64 id;
    address admin;
    OrganizationStatus status;
    uint64 createdAt;
    string slug;
    string metadataURI;
}
```

Notes:

- `slug` should be unique if feasible, but v0.1 may enforce uniqueness through a `mapping(bytes32 => bool)` using `keccak256(bytes(slug))`.
- `metadataURI` points to JSON metadata.

### 7.2 Body

```solidity
struct Body {
    uint64 id;
    uint64 orgId;
    BodyKind kind;
    bool active;
    uint64 createdAt;
    string metadataURI;
}
```

### 7.3 Role

```solidity
struct Role {
    uint64 id;
    uint64 orgId;
    uint64 bodyId;
    RoleType roleType;
    bool active;
    string metadataURI;
}
```

### 7.4 Mandate

```solidity
struct Mandate {
    uint64 id;
    uint64 orgId;
    uint64 bodyId;
    uint64 roleId;
    address holder;
    uint64 startTime;
    uint64 endTime;
    uint256 proposalTypeMask;
    uint128 spendingLimit;
    bool active;
    bool revoked;
}
```

Notes:

- `proposalTypeMask` controls which proposal types this mandate can act on.
- For v0.1, `spendingLimit` is informational or demo-only unless a treasury demo action uses it.

### 7.5 PolicyRule

For v0.1, keep this simple.

```solidity
struct PolicyRule {
    uint64 orgId;
    ProposalType proposalType;
    uint64[] requiredApprovalBodies;
    uint64[] vetoBodies;
    uint64 executorBody;
    uint64 timelockSeconds;
    bool enabled;
}
```

Notes:

- This is not gas-optimal for all production cases, but acceptable for v0.1.
- If gas becomes problematic, replace arrays with fixed-size arrays or store body requirements separately.

### 7.6 Proposal

```solidity
struct Proposal {
    uint64 id;
    uint64 orgId;
    ProposalType proposalType;
    ProposalStatus status;
    address creator;
    address target;
    uint256 value;
    bytes32 dataHash;
    uint64 createdAt;
    uint64 queuedAt;
    uint64 executableAt;
    uint64 executedAt;
    string metadataURI;
}
```

Notes:

- `metadataURI` points to title/description/action details.
- `dataHash` anchors the intended action data without requiring full rich metadata on-chain.

---

## 8. Proposal type mask helper

Use a mask to restrict mandates by proposal type.

Example:

```solidity
function proposalTypeBit(ProposalType proposalType) internal pure returns (uint256) {
    return 1 << uint8(proposalType);
}
```

A mandate allows a proposal type if:

```solidity
(mandate.proposalTypeMask & proposalTypeBit(proposalType)) != 0
```

---

## 9. GovCore responsibilities

`GovCore` owns:

- organization registry;
- body registry;
- role registry;
- mandate registry;
- policy rules;
- read/check helpers for `GovProposals`.

---

## 10. GovCore storage outline

```solidity
uint64 public nextOrgId;
uint64 public nextBodyId;
uint64 public nextRoleId;
uint64 public nextMandateId;

mapping(uint64 => Organization) public organizations;
mapping(bytes32 => bool) public slugExists;

mapping(uint64 => Body) public bodies;
mapping(uint64 => Role) public roles;
mapping(uint64 => Mandate) public mandates;

// orgId => proposalType => policy rule
mapping(uint64 => mapping(ProposalType => PolicyRule)) internal policyRules;

// Optional fast lookup indexes
mapping(uint64 => uint64[]) internal orgBodies;
mapping(uint64 => uint64[]) internal bodyRoles;
mapping(address => uint64[]) internal holderMandates;
```

Important:

- arrays are acceptable for basic getters in v0.1, but frontend should use indexer/read models for lists;
- authorization checks should not require unbounded loops over large arrays in production; v0.1 may accept simple loops if scoped.

---

## 11. GovCore access rules

### 11.1 Organization admin

Organization admin can:

- update organization metadata;
- set status, within allowed transitions;
- create bodies;
- create roles;
- assign/revoke mandates;
- set policy rules.

For v0.1, organization admin can be a single address.

Later versions may replace this with role-based org admin or external governor.

### 11.2 Mandate validity

A mandate is valid if:

- exists;
- `active == true`;
- `revoked == false`;
- `holder == actor`;
- current timestamp is within `[startTime, endTime]`, unless `endTime == 0` is treated as no expiry;
- proposal type mask allows the target proposal type;
- role type matches required action.

---

## 12. GovCore functions

### 12.1 Organization functions

```solidity
function createOrganization(
    string calldata slug,
    string calldata metadataURI,
    address admin
) external returns (uint64 orgId);
```

Requirements:

- `admin != address(0)`;
- slug non-empty;
- slug unique;
- emits `OrganizationCreated`.

```solidity
function updateOrganizationMetadata(
    uint64 orgId,
    string calldata metadataURI
) external;
```

Requirements:

- caller is organization admin;
- organization exists;
- emits `OrganizationUpdated`.

```solidity
function setOrganizationStatus(
    uint64 orgId,
    OrganizationStatus status
) external;
```

Requirements:

- caller is organization admin;
- organization exists;
- emits `OrganizationStatusChanged`.

### 12.2 Body functions

```solidity
function createBody(
    uint64 orgId,
    BodyKind kind,
    string calldata metadataURI
) external returns (uint64 bodyId);
```

Requirements:

- organization active;
- caller is organization admin;
- emits `BodyCreated`.

```solidity
function updateBody(
    uint64 orgId,
    uint64 bodyId,
    bool active,
    string calldata metadataURI
) external;
```

Requirements:

- body belongs to org;
- caller is organization admin;
- emits `BodyUpdated`.

### 12.3 Role functions

```solidity
function createRole(
    uint64 orgId,
    uint64 bodyId,
    RoleType roleType,
    string calldata metadataURI
) external returns (uint64 roleId);
```

Requirements:

- body belongs to org;
- organization active;
- caller is organization admin;
- emits `RoleCreated`.

```solidity
function updateRole(
    uint64 orgId,
    uint64 roleId,
    bool active,
    string calldata metadataURI
) external;
```

Requirements:

- role belongs to org;
- caller is organization admin;
- emits `RoleUpdated`.

### 12.4 Mandate functions

```solidity
function assignMandate(
    uint64 orgId,
    uint64 roleId,
    address holder,
    uint64 startTime,
    uint64 endTime,
    uint256 proposalTypeMask,
    uint128 spendingLimit
) external returns (uint64 mandateId);
```

Requirements:

- role belongs to org;
- holder not zero;
- organization active;
- caller is organization admin;
- if `endTime != 0`, `endTime > startTime`;
- emits `MandateAssigned`.

```solidity
function revokeMandate(
    uint64 orgId,
    uint64 mandateId
) external;
```

Requirements:

- mandate belongs to org;
- caller is organization admin;
- mandate not already revoked;
- emits `MandateRevoked`.

### 12.5 Policy functions

```solidity
function setPolicyRule(
    uint64 orgId,
    ProposalType proposalType,
    uint64[] calldata requiredApprovalBodies,
    uint64[] calldata vetoBodies,
    uint64 executorBody,
    uint64 timelockSeconds,
    bool enabled
) external;
```

Requirements:

- organization active;
- caller is organization admin;
- all bodies belong to org;
- proposalType not Unknown;
- emits `PolicyRuleSet`.

```solidity
function getPolicyRule(
    uint64 orgId,
    ProposalType proposalType
) external view returns (PolicyRule memory);
```

### 12.6 Authorization helpers

```solidity
function canActOnProposalType(
    uint64 orgId,
    address actor,
    uint64 bodyId,
    RoleType roleType,
    ProposalType proposalType
) external view returns (bool);
```

This should check active role/mandate membership for the actor.

```solidity
function isBodyMember(
    uint64 orgId,
    address actor,
    uint64 bodyId
) external view returns (bool);
```

```solidity
function bodyBelongsToOrg(uint64 orgId, uint64 bodyId) external view returns (bool);
```

---

## 13. GovProposals responsibilities

`GovProposals` owns:

- proposal creation;
- proposal lifecycle;
- approvals;
- vetoes;
- queueing;
- controlled demo execution.

It must call `GovCore` for authority and policy checks.

---

## 14. GovProposals storage outline

```solidity
IGovCore public immutable govCore;
uint64 public nextProposalId;

mapping(uint64 => Proposal) public proposals;

// proposalId => bodyId => approved
mapping(uint64 => mapping(uint64 => bool)) public proposalApprovals;

// proposalId => bodyId => vetoed
mapping(uint64 => mapping(uint64 => bool)) public proposalVetoes;

// proposalId => bodyId => actor who approved/vetoed, optional for direct lookup
mapping(uint64 => mapping(uint64 => address)) public proposalDecisionActor;
```

---

## 15. GovProposals functions

### 15.1 createProposal

```solidity
function createProposal(
    uint64 orgId,
    ProposalType proposalType,
    address target,
    uint256 value,
    bytes32 dataHash,
    string calldata metadataURI
) external returns (uint64 proposalId);
```

Requirements:

- organization active;
- policy rule enabled;
- caller has `Proposer` mandate for at least one relevant body or is org admin if allowed in v0.1;
- proposal type not Unknown;
- emits `ProposalCreated`;
- sets status to `UnderReview` unless no approvals required.

### 15.2 approveProposal

```solidity
function approveProposal(uint64 orgId, uint64 proposalId, uint64 bodyId) external;
```

Requirements:

- proposal belongs to org;
- proposal status is `Created` or `UnderReview`;
- body is required approver for proposal type;
- caller has valid `Approver` mandate for body and proposal type;
- body has not already approved;
- emits `ProposalApproved`;
- if all required approvals are collected, status becomes `Approved`.

### 15.3 vetoProposal

```solidity
function vetoProposal(uint64 orgId, uint64 proposalId, uint64 bodyId) external;
```

Requirements:

- proposal belongs to org;
- proposal not executed/cancelled/vetoed;
- body is veto-capable for proposal type;
- caller has valid `Vetoer` mandate for body and proposal type;
- emits `ProposalVetoed`;
- status becomes `Vetoed`.

### 15.4 queueProposal

```solidity
function queueProposal(uint64 orgId, uint64 proposalId) external;
```

Requirements:

- proposal belongs to org;
- proposal status is `Approved`;
- if timelock > 0, set `queuedAt` and `executableAt`;
- if timelock == 0, proposal may be executable immediately or set to `Queued` with `executableAt = now`;
- emits `ProposalQueued`.

### 15.5 executeProposal

```solidity
function executeProposal(
    uint64 orgId,
    uint64 proposalId,
    bytes calldata actionData
) external payable;
```

Requirements:

- proposal belongs to org;
- status is `Approved` or `Queued`;
- all required approvals collected;
- not vetoed;
- timelock satisfied;
- caller has valid `Executor` mandate for executor body and proposal type;
- `keccak256(actionData) == proposal.dataHash` if using action data;
- target execution restricted to `DemoTarget` or whitelist for v0.1;
- emits `ProposalExecuted`.

### 15.6 cancelProposal

```solidity
function cancelProposal(uint64 orgId, uint64 proposalId) external;
```

Requirements:

- proposal belongs to org;
- caller is org admin or proposal creator if allowed;
- proposal not executed;
- emits `ProposalCancelled`.

---

## 16. Events

### 16.1 GovCore events

```solidity
event OrganizationCreated(
    uint64 indexed orgId,
    string slug,
    address indexed admin,
    string metadataURI
);

event OrganizationUpdated(
    uint64 indexed orgId,
    string metadataURI
);

event OrganizationStatusChanged(
    uint64 indexed orgId,
    OrganizationStatus status
);

event BodyCreated(
    uint64 indexed orgId,
    uint64 indexed bodyId,
    BodyKind kind,
    string metadataURI
);

event BodyUpdated(
    uint64 indexed orgId,
    uint64 indexed bodyId,
    bool active,
    string metadataURI
);

event RoleCreated(
    uint64 indexed orgId,
    uint64 indexed roleId,
    uint64 indexed bodyId,
    RoleType roleType,
    string metadataURI
);

event RoleUpdated(
    uint64 indexed orgId,
    uint64 indexed roleId,
    bool active,
    string metadataURI
);

event MandateAssigned(
    uint64 indexed orgId,
    uint64 indexed mandateId,
    uint64 indexed roleId,
    uint64 bodyId,
    address holder,
    uint64 startTime,
    uint64 endTime,
    uint256 proposalTypeMask,
    uint128 spendingLimit
);

event MandateRevoked(
    uint64 indexed orgId,
    uint64 indexed mandateId,
    address indexed holder
);

event PolicyRuleSet(
    uint64 indexed orgId,
    ProposalType indexed proposalType,
    uint64[] requiredApprovalBodies,
    uint64[] vetoBodies,
    uint64 executorBody,
    uint64 timelockSeconds,
    bool enabled
);
```

### 16.2 GovProposals events

```solidity
event ProposalCreated(
    uint64 indexed orgId,
    uint64 indexed proposalId,
    ProposalType indexed proposalType,
    address creator,
    address target,
    uint256 value,
    bytes32 dataHash,
    string metadataURI
);

event ProposalApproved(
    uint64 indexed orgId,
    uint64 indexed proposalId,
    uint64 indexed bodyId,
    address actor
);

event ProposalVetoed(
    uint64 indexed orgId,
    uint64 indexed proposalId,
    uint64 indexed bodyId,
    address actor
);

event ProposalQueued(
    uint64 indexed orgId,
    uint64 indexed proposalId,
    uint64 queuedAt,
    uint64 executableAt
);

event ProposalExecuted(
    uint64 indexed orgId,
    uint64 indexed proposalId,
    address indexed executor,
    address target,
    bytes32 dataHash
);

event ProposalCancelled(
    uint64 indexed orgId,
    uint64 indexed proposalId,
    address indexed actor
);
```

---

## 17. Custom errors

Recommended errors:

```solidity
error ZeroAddress();
error EmptySlug();
error SlugAlreadyExists();
error OrganizationNotFound(uint64 orgId);
error OrganizationNotActive(uint64 orgId);
error Unauthorized(address actor);
error BodyNotFound(uint64 bodyId);
error BodyDoesNotBelongToOrg(uint64 orgId, uint64 bodyId);
error RoleNotFound(uint64 roleId);
error RoleDoesNotBelongToOrg(uint64 orgId, uint64 roleId);
error MandateNotFound(uint64 mandateId);
error InvalidMandateTimeRange();
error InvalidProposalType();
error PolicyRuleNotEnabled(uint64 orgId, ProposalType proposalType);
error ProposalNotFound(uint64 proposalId);
error ProposalDoesNotBelongToOrg(uint64 orgId, uint64 proposalId);
error InvalidProposalStatus(ProposalStatus current);
error BodyNotRequiredApprover(uint64 bodyId);
error BodyNotVetoer(uint64 bodyId);
error AlreadyApproved(uint64 proposalId, uint64 bodyId);
error AlreadyVetoed(uint64 proposalId, uint64 bodyId);
error MissingRequiredApprovals(uint64 proposalId);
error TimelockNotExpired(uint64 proposalId, uint64 executableAt);
error DataHashMismatch(bytes32 expected, bytes32 actual);
error TargetNotAllowed(address target);
```

---

## 18. Access matrix

| Action | Required authority |
| --- | --- |
| Create organization | Any caller in v0.1, or deployer-controlled if desired |
| Update organization | Organization admin |
| Set organization status | Organization admin |
| Create body | Organization admin |
| Create role | Organization admin |
| Assign mandate | Organization admin |
| Revoke mandate | Organization admin |
| Set policy rule | Organization admin |
| Create proposal | Proposer mandate for proposal type, or org admin in v0.1 fallback |
| Approve proposal | Approver mandate in required body |
| Veto proposal | Vetoer mandate in veto-capable body |
| Queue proposal | Any caller or Executor; v0.1 can allow any caller after approval |
| Execute proposal | Executor mandate in configured executor body |
| Cancel proposal | Organization admin, or creator before first approval if allowed |

---

## 19. Demo topologies

### 19.1 Simple DAO+

Bodies:

- General Council
- Treasury Committee
- Security Council

Policies:

- Standard: approval by General Council
- Treasury: approval by Treasury Committee + General Council, veto by Security Council, timelock 1 hour
- Upgrade: approval by General Council + Security Council, timelock 2 hours
- Emergency: approval by Security Council, timelock 0

### 19.2 Bicameral preview

Bodies:

- Capital House
- Merit House
- Emergency Council

Policies:

- Treasury: approval by Capital House
- Upgrade: approval by Merit House, veto by Emergency Council
- Emergency: approval by Emergency Council

---

## 20. Contract tests

### 20.1 Required happy-path tests

- create organization;
- create multiple organizations and verify isolation;
- create bodies under org;
- create roles under body;
- assign mandate;
- set policy rule;
- create proposal;
- approve proposal through required bodies;
- queue proposal;
- execute proposal against DemoTarget;
- veto proposal.

### 20.2 Required negative tests

- body from org A used in org B policy;
- role from org A used in org B mandate;
- proposal approved by unauthorized actor;
- proposal vetoed by non-veto body;
- proposal executed before approvals;
- proposal executed before timelock;
- expired/revoked mandate cannot act;
- repeated approval by same body fails;
- data hash mismatch prevents execution;
- non-whitelisted target blocked in v0.1.

### 20.3 Invariants

- proposal cannot be both `Executed` and `Vetoed`;
- proposal cannot be executed twice;
- entity `orgId` boundaries are never crossed;
- revoked mandate never authorizes action;
- disabled policy never routes proposal.

---

## 21. Seed scripts

The protocol repo MUST include seed scripts that deploy and configure:

- GovCore;
- GovProposals;
- DemoTarget;
- Simple DAO+ organization;
- Bicameral preview organization;
- bodies;
- roles;
- mandates for sample wallets;
- policies;
- at least two demo proposals.

---

## 22. Acceptance criteria

Protocol v0.1 is complete when:

- one shared deployment supports at least two organizations;
- organization data is isolated by `orgId`;
- bodies/roles/mandates/policies/proposals work end-to-end;
- approval/veto/queue/execute lifecycle is enforced on-chain;
- all critical transitions emit events;
- seed script creates demo topology;
- tests cover happy paths, negative paths, and core invariants;
- DemoTarget state changes only after valid proposal execution.
