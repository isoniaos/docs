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

## Non-goals for v0.1
- GraphQL
- arbitrary filtering DSL
- external public write API for governance actions

