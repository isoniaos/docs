# IsoniaOS v0.1 — Event Contract Specification

## Purpose

Events define the contract between `isonia-protocol`, `control-plane`, `app-core`, `sdk`, and SaaS extensions.

Control Plane must build read models primarily from events without excessive historical reads.

## Event identity

Logical event identity:

```txt
chainId + txHash + logIndex
```

Physical raw log identity:

```txt
chainId
blockHash
txHash
logIndex
```

Also store:

```txt
contractAddress
blockNumber
eventName
```

## Design rules

- Include `orgId` in every organization-scoped event.
- Emit enough data for projections.
- Keep large text off-chain via `metadataURI`, `descriptionURI`, `dataHash`.
- Prefer deterministic status transitions.

## GovCore events

```solidity
event OrganizationCreated(uint64 indexed orgId, string slug, address indexed admin, string metadataURI);
event OrganizationUpdated(uint64 indexed orgId, string metadataURI);
event OrganizationStatusChanged(uint64 indexed orgId, GovTypes.OrganizationStatus status);
```

```solidity
event BodyCreated(uint64 indexed orgId, uint64 indexed bodyId, GovTypes.BodyKind kind, string metadataURI);
event BodyUpdated(uint64 indexed orgId, uint64 indexed bodyId, bool active, string metadataURI);
```

```solidity
event RoleCreated(uint64 indexed orgId, uint64 indexed roleId, uint64 indexed bodyId, GovTypes.RoleType roleType, string metadataURI);
event RoleUpdated(uint64 indexed orgId, uint64 indexed roleId, bool active, string metadataURI);
```

```solidity
event MandateAssigned(uint64 indexed orgId, uint64 indexed mandateId, uint64 indexed roleId, uint64 bodyId, address holder, uint64 startTime, uint64 endTime, uint256 proposalTypeMask, uint128 spendingLimit);
event MandateRevoked(uint64 indexed orgId, uint64 indexed mandateId, address indexed holder);
```

```solidity
event PolicyRuleSet(uint64 indexed orgId, GovTypes.ProposalType indexed proposalType, uint64 version, uint64[] requiredApprovalBodies, uint64[] vetoBodies, uint64 executorBody, uint64 timelockSeconds, bool enabled);
```

## GovProposals events

```solidity
event ProposalCreated(uint64 indexed orgId, uint64 indexed proposalId, GovTypes.ProposalType indexed proposalType, uint64 policyVersion, address creator, address target, uint256 value, bytes32 dataHash, string metadataURI);
event ProposalApproved(uint64 indexed orgId, uint64 indexed proposalId, uint64 indexed bodyId, address actor);
event ProposalVetoed(uint64 indexed orgId, uint64 indexed proposalId, uint64 indexed bodyId, address actor);
event ProposalQueued(uint64 indexed orgId, uint64 indexed proposalId, uint64 queuedAt, uint64 executableAt);
event ProposalExecuted(uint64 indexed orgId, uint64 indexed proposalId, address indexed executor, address target, bytes32 dataHash);
event ProposalCancelled(uint64 indexed orgId, uint64 indexed proposalId, address indexed actor);
event ProposalStatusChanged(uint64 indexed orgId, uint64 indexed proposalId, GovTypes.ProposalStatus previousStatus, GovTypes.ProposalStatus newStatus);
```

## Enum mappings

Organization status:

```txt
0 = None
1 = Active
2 = Paused
3 = Archived
```

Role type:

```txt
0 = Unknown
1 = OrgAdmin
2 = BodyAdmin
3 = Proposer
4 = Approver
5 = Vetoer
6 = Executor
7 = EmergencyOperator
```

Proposal type:

```txt
0 = Unknown
1 = Standard
2 = Treasury
3 = Upgrade
4 = Emergency
```

Proposal status:

```txt
0 = None
1 = Created
2 = UnderReview
3 = Approved
4 = Queued
5 = Vetoed
6 = Executed
7 = Cancelled
8 = Expired
```
