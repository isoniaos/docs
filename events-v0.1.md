# IsoniaOS v0.1 — Event Contract Specification

## Purpose

Events define the contract between `isonia-protocol`, `control-plane`, `app-core`, `sdk`, and SaaS extensions.

Control Plane must build read models primarily from events without excessive historical reads.

## Event identity

```txt
chainId + txHash + logIndex
```

Also store:

```txt
contractAddress
blockNumber
blockHash
eventName
```

## Design rules

- Include `orgId` in every organization-scoped event.
- Emit enough data for projections.
- Keep large text off-chain via `metadataURI`, `descriptionURI`, `dataHash`.
- Prefer deterministic status transitions.

## GovCore events

```solidity
event OrganizationCreated(uint256 indexed orgId, address indexed admin, string slug, string name, string metadataURI, uint64 createdAt);
event OrganizationUpdated(uint256 indexed orgId, string name, string metadataURI, uint64 updatedAt);
event OrganizationStatusChanged(uint256 indexed orgId, uint8 previousStatus, uint8 newStatus, uint64 updatedAt);
```

```solidity
event BodyCreated(uint256 indexed orgId, uint256 indexed bodyId, uint8 kind, string name, string metadataURI, bool active, uint64 createdAt);
event BodyUpdated(uint256 indexed orgId, uint256 indexed bodyId, uint8 kind, string name, string metadataURI, bool active, uint64 updatedAt);
```

```solidity
event RoleCreated(uint256 indexed orgId, uint256 indexed bodyId, uint256 indexed roleId, uint8 roleType, string name, string metadataURI, bool active);
event RoleUpdated(uint256 indexed orgId, uint256 indexed roleId, uint8 roleType, string name, string metadataURI, bool active);
```

```solidity
event MandateAssigned(uint256 indexed orgId, uint256 indexed mandateId, uint256 indexed roleId, uint256 bodyId, address holder, uint64 startTime, uint64 endTime, uint256 proposalTypeMask, uint256 spendingLimit);
event MandateRevoked(uint256 indexed orgId, uint256 indexed mandateId, address indexed revokedBy, uint64 revokedAt);
```

```solidity
event PolicyRuleSet(uint256 indexed orgId, uint8 indexed proposalType, uint256[] requiredApprovalBodies, uint256[] vetoBodies, uint256 executorBody, uint64 timelockSeconds, bool enabled);
```

## GovProposals events

```solidity
event ProposalCreated(uint256 indexed orgId, uint256 indexed proposalId, uint8 indexed proposalType, address creator, string title, string descriptionURI, address target, uint256 value, bytes32 dataHash, uint8 status, uint64 createdAt);
event ProposalApproved(uint256 indexed orgId, uint256 indexed proposalId, uint256 indexed bodyId, address actor, uint64 approvedAt);
event ProposalVetoed(uint256 indexed orgId, uint256 indexed proposalId, uint256 indexed bodyId, address actor, uint64 vetoedAt);
event ProposalQueued(uint256 indexed orgId, uint256 indexed proposalId, uint64 queuedAt, uint64 executableAt);
event ProposalExecuted(uint256 indexed orgId, uint256 indexed proposalId, address indexed executor, address target, uint256 value, bytes32 dataHash, uint64 executedAt);
event ProposalCancelled(uint256 indexed orgId, uint256 indexed proposalId, address indexed cancelledBy, uint64 cancelledAt);
event ProposalStatusChanged(uint256 indexed orgId, uint256 indexed proposalId, uint8 previousStatus, uint8 newStatus, uint64 changedAt);
```

## Enum mappings

Organization status:

```txt
0 = Active
1 = Paused
2 = Archived
```

Role type:

```txt
0 = BodyAdmin
1 = Proposer
2 = Approver
3 = Vetoer
4 = Executor
5 = EmergencyPauser
```

Proposal type:

```txt
0 = Standard
1 = Treasury
2 = Upgrade
3 = Emergency
```

Proposal status:

```txt
0 = Created
1 = UnderReview
2 = Approved
3 = Queued
4 = Vetoed
5 = Executed
6 = Cancelled
7 = Expired
```
