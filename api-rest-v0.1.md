# IsoniaOS v0.1 — REST API Spec

## Principles

- REST only for v0.1
- JSON only
- versioned routes under `/v1`
- org-centric read models
- deterministic DTOs

## Endpoints

### System

- `GET /v1/health`
- `GET /v1/version`
- `GET /v1/diagnostics`

### Organizations

- `GET /v1/orgs`
- `GET /v1/orgs/:orgId`
- `GET /v1/orgs/:orgId/overview`

### Bodies / Roles / Mandates

- `GET /v1/orgs/:orgId/bodies`
- `GET /v1/orgs/:orgId/roles`
- `GET /v1/orgs/:orgId/mandates`
- `GET /v1/orgs/:orgId/holders/:address/mandates`

### Proposals

- `GET /v1/orgs/:orgId/proposals`
- `GET /v1/orgs/:orgId/proposals/:proposalId`
- `GET /v1/orgs/:orgId/proposals/:proposalId/route`

### Graph

- `GET /v1/orgs/:orgId/graph`

## Route explanation response

```json
{
  "orgId": 1,
  "proposalId": 7,
  "proposalType": "TREASURY",
  "status": "Queued",
  "requiredApproverBodies": [
    { "bodyId": 2, "name": "Treasury Committee", "approved": true },
    { "bodyId": 1, "name": "General Council", "approved": true }
  ],
  "vetoBodies": [
    { "bodyId": 3, "name": "Security Council", "vetoed": false }
  ],
  "timelockSeconds": 3600,
  "executableAt": 1730000000,
  "isExecutable": false,
  "blockingReasons": ["timelock_not_elapsed"]
}
```

## Diagnostics response

`GET /v1/diagnostics` exposes operator-safe status for indexing,
projection, and configuration. It must not expose database URLs, private keys,
full environment dumps, or privileged SaaS configuration.

```json
{
  "apiVersion": "v1",
  "chainId": 31337,
  "confirmations": 5,
  "contracts": [
    {
      "name": "govCore",
      "configured": true,
      "address": "0x0000000000000000000000000000000000000001"
    },
    {
      "name": "govProposals",
      "configured": true,
      "address": "0x0000000000000000000000000000000000000002"
    }
  ],
  "latestChainBlock": "120",
  "latestSafeBlock": "115",
  "lastScannedBlocks": [
    {
      "contractName": "govCore",
      "address": "0x0000000000000000000000000000000000000001",
      "lastScannedBlock": "100",
      "lastConfirmedBlock": "100",
      "lagFromSafeBlock": "15"
    }
  ],
  "rawEventCounts": {
    "observed": 0,
    "confirmed": 2,
    "processed": 3,
    "failed": 1,
    "orphaned": 0
  },
  "projectionBacklog": 2,
  "failedProjectionCount": 1,
  "latestProjectionError": {
    "rawEventId": "9",
    "chainId": 31337,
    "contractAddress": "0x0000000000000000000000000000000000000001",
    "blockNumber": "99",
    "txHash": "0xabc",
    "logIndex": 4,
    "eventName": "ProposalCreated",
    "error": "Missing event argument: orgId",
    "failedAt": "2026-04-29T12:05:00.000Z",
    "processingAttempts": 2
  },
  "staleDataIndicators": [
    {
      "code": "indexer_behind_safe_block",
      "severity": "warning",
      "message": "govCore indexer cursor is behind the latest safe block.",
      "contractName": "govCore",
      "lastScannedBlock": "100",
      "latestSafeBlock": "115",
      "lagBlocks": "15"
    }
  ],
  "generatedAt": "2026-04-29T12:10:00.000Z"
}
```

## Non-goals for v0.1

- GraphQL
- arbitrary filtering DSL
- external public write API for governance actions
