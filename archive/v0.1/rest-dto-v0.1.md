# IsoniaOS v0.1 — REST DTO Specification

## Purpose

Define DTOs shared by `control-plane`, `app-core`, `saas`, `@isonia/types`, and `@isonia/sdk`.

REST is the only API style for v0.1. GraphQL is postponed.

`@isonia/types` is the canonical implementation package for these DTOs. Every DTO, enum, route explanation, event-facing shape, or graph shape change must update `@isonia/types/README.md`, `@isonia/types/CHANGELOG.md`, and this specification in the same change set.

## Shared TypeScript enums

```ts
export enum OrganizationStatus { Active = "active", Paused = "paused", Archived = "archived" }
export enum BodyKind { GeneralCouncil = "general_council", TreasuryCommittee = "treasury_committee", SecurityCouncil = "security_council", CapitalHouse = "capital_house", MeritHouse = "merit_house", EmergencyCouncil = "emergency_council", Custom = "custom" }
export enum RoleType { OrgAdmin = "org_admin", BodyAdmin = "body_admin", Proposer = "proposer", Approver = "approver", Vetoer = "vetoer", Executor = "executor", EmergencyOperator = "emergency_operator" }
export enum ProposalType { Standard = "standard", Treasury = "treasury", Upgrade = "upgrade", Emergency = "emergency" }
export enum ProposalStatus { Created = "created", UnderReview = "under_review", Approved = "approved", Queued = "queued", Vetoed = "vetoed", Executed = "executed", Cancelled = "cancelled", Expired = "expired" }
export enum DecisionType { Approve = "approve", Veto = "veto" }
export enum GraphNodeType { Organization = "organization", Body = "body", Role = "role", Holder = "holder", Proposal = "proposal", ProposalType = "proposal_type" }
export enum GraphEdgeType { Owns = "owns", Contains = "contains", Holds = "holds", RequiresApproval = "requires_approval", CanVeto = "can_veto", CanExecute = "can_execute", Decided = "decided" }
```

## Chain enum maps

Use explicit numeric maps when decoding Solidity enums from events or contract reads. Do not rely on array positions.

Examples:

```ts
import { PROPOSAL_TYPE_CHAIN_MAP } from "@isonia/types/constants/proposal-type-chain-map";
import { ROLE_TYPE_CHAIN_MAP } from "@isonia/types/constants/role-type-chain-map";
```

Equivalent map files exist for `OrganizationStatus`, `BodyKind`, `RoleType`, `ProposalType`, `ProposalStatus`, and `DecisionType`.

## Base types

```ts
export type ChainId = number;
export type Address = `0x${string}`;
```

## Organization DTO

The chain event stores `metadataURI`, while the control plane resolves human-readable names from metadata. REST DTOs keep `name` required and must provide a fallback such as `Organization #1` if metadata is unavailable.

```ts
export interface OrganizationDto {
  chainId: ChainId;
  orgId: string;
  slug: string;
  name: string;
  metadataUri?: string;
  adminAddress: Address;
  status: OrganizationStatus;
  createdBlock: string;
  createdTxHash: string;
}

export interface OrganizationOverviewDto {
  organization: OrganizationDto;
  counts: { bodies: number; roles: number; activeMandates: number; activeProposals: number };
  latestProposals: ProposalSummaryDto[];
}
```

## Body / Role / Mandate DTOs

`BodyDto.name` and `RoleDto.name` are also required and should use metadata-derived values with stable fallbacks like `Body #2` or `Role #3` when metadata cannot be resolved.

```ts
export interface BodyDto { chainId: ChainId; orgId: string; bodyId: string; kind: BodyKind; name: string; metadataUri?: string; active: boolean; createdBlock: string; }
export interface RoleDto { chainId: ChainId; orgId: string; bodyId: string; roleId: string; roleType: RoleType; name: string; metadataUri?: string; active: boolean; }
export interface MandateDto { chainId: ChainId; orgId: string; mandateId: string; bodyId: string; roleId: string; holderAddress: Address; startTime: string; endTime: string; proposalTypeMask: string; spendingLimit: string; active: boolean; revoked: boolean; }
```

## Policy Rule DTO

```ts
export interface PolicyRuleDto {
  chainId: ChainId;
  orgId: string;
  proposalType: ProposalType;
  version: string;
  requiredApprovalBodies: string[];
  vetoBodies: string[];
  executorBody?: string;
  timelockSeconds: string;
  enabled: boolean;
}

export type OrganizationPolicyDto = PolicyRuleDto;
export type OrganizationPoliciesDto = readonly OrganizationPolicyDto[];
```

## Proposal DTOs

```ts
export interface ProposalSummaryDto { chainId: ChainId; orgId: string; proposalId: string; proposalType: ProposalType; policyVersion: string; title: string; creatorAddress: Address; status: ProposalStatus; createdAtChain: string; }
export interface ProposalDto { chainId: ChainId; orgId: string; proposalId: string; proposalType: ProposalType; policyVersion: string; title: string; descriptionUri?: string; targetAddress?: Address; value: string; dataHash?: string; creatorAddress: Address; status: ProposalStatus; createdBlock: string; createdTxHash: string; createdAtChain: string; queuedAtChain?: string; executableAtChain?: string; executedAtChain?: string; }
export interface ProposalDecisionDto { chainId: ChainId; orgId: string; proposalId: string; bodyId: string; actorAddress: Address; decisionType: DecisionType; blockNumber: string; txHash: string; decidedAtChain: string; }
```

## Route Explanation DTO

```ts
export interface ProposalRouteExplanationDto {
  chainId: ChainId;
  orgId: string;
  proposalId: string;
  proposalType: ProposalType;
  policyVersion: string;
  status: ProposalStatus;
  requiredApprovalBodies: RouteBodyRequirementDto[];
  vetoBodies: RouteBodyVetoDto[];
  timelock: { required: boolean; seconds: string; queuedAtChain?: string; executableAtChain?: string; satisfied: boolean };
  execution: { executable: boolean; executorBody?: string; blockedReasons: RouteBlockedReasonDto[] };
}

export interface RouteBodyRequirementDto { bodyId: string; bodyName: string; required: boolean; approved: boolean; approvedBy?: Address; approvedAtChain?: string; txHash?: string; }
export interface RouteBodyVetoDto { bodyId: string; bodyName: string; canVeto: boolean; vetoed: boolean; vetoedBy?: Address; vetoedAtChain?: string; txHash?: string; }
export interface RouteBlockedReasonDto { code: "missing_approval" | "vetoed" | "not_queued" | "timelock_not_satisfied" | "already_executed" | "cancelled" | "expired" | "policy_disabled" | "policy_snapshot_missing" | "unknown"; message: string; relatedBodyId?: string; }
```

## Governance Graph DTO

```ts
export interface GovernanceGraphDto { chainId: ChainId; orgId: string; nodes: GovernanceGraphNodeDto[]; edges: GovernanceGraphEdgeDto[]; }
export interface GovernanceGraphNodeDto { id: string; type: GraphNodeType; label: string; metadata?: Record<string, unknown>; }
export interface GovernanceGraphEdgeDto { id: string; sourceId: string; targetId: string; type: GraphEdgeType; label?: string; metadata?: Record<string, unknown>; }
```

## Diagnostics DTO

Diagnostics DTOs are operator-facing, REST-safe, and shared through
`@isonia/types`. They must not expose database URLs, private keys, full
environment dumps, or privileged SaaS configuration.

```ts
export type DiagnosticsContractName = "govCore" | "govProposals";
export type DiagnosticsIndicatorSeverity = "info" | "warning" | "error";
export type DiagnosticsIndicatorCode =
  | "contract_address_missing"
  | "latest_chain_block_unavailable"
  | "contract_cursor_missing"
  | "indexer_behind_safe_block"
  | "projection_backlog"
  | "projection_failures";

export interface DiagnosticsContractDto {
  name: DiagnosticsContractName;
  configured: boolean;
  address?: Address;
}

export interface DiagnosticsContractCursorDto {
  contractName: DiagnosticsContractName;
  address: Address;
  lastScannedBlock?: string;
  lastConfirmedBlock?: string;
  updatedAt?: string;
  lagFromSafeBlock?: string;
}

export interface DiagnosticsRawEventCountsDto {
  observed: number;
  confirmed: number;
  processed: number;
  failed: number;
  orphaned: number;
}

export interface DiagnosticsProjectionErrorDto {
  rawEventId: string;
  chainId: ChainId;
  contractAddress: Address;
  blockNumber: string;
  txHash: string;
  logIndex: number;
  eventName: string;
  error: string;
  failedAt?: string;
  processingAttempts: number;
}

export interface DiagnosticsStaleDataIndicatorDto {
  code: DiagnosticsIndicatorCode;
  severity: DiagnosticsIndicatorSeverity;
  message: string;
  contractName?: DiagnosticsContractName;
  contractAddress?: Address;
  lastScannedBlock?: string;
  latestSafeBlock?: string;
  lagBlocks?: string;
}

export interface DiagnosticsDto {
  apiVersion: string;
  chainId: ChainId;
  confirmations: number;
  contracts: DiagnosticsContractDto[];
  latestChainBlock?: string;
  latestSafeBlock?: string;
  lastScannedBlocks: DiagnosticsContractCursorDto[];
  rawEventCounts: DiagnosticsRawEventCountsDto;
  projectionBacklog: number;
  failedProjectionCount: number;
  latestProjectionError?: DiagnosticsProjectionErrorDto;
  staleDataIndicators: DiagnosticsStaleDataIndicatorDto[];
  generatedAt: string;
}
```

## REST endpoints

```txt
GET /v1/health
GET /v1/version
GET /v1/diagnostics
GET /v1/orgs
GET /v1/orgs/:orgId
GET /v1/orgs/:orgId/overview
GET /v1/orgs/:orgId/bodies
GET /v1/orgs/:orgId/roles
GET /v1/orgs/:orgId/mandates
GET /v1/orgs/:orgId/holders/:address/mandates
GET /v1/orgs/:orgId/policies
GET /v1/orgs/:orgId/proposals
GET /v1/orgs/:orgId/proposals/:proposalId
GET /v1/orgs/:orgId/proposals/:proposalId/route
GET /v1/orgs/:orgId/graph
```
