# IsoniaOS v0.5 Design Partner Setup Guide

Status: Alpha guide  
Scope: Simple DAO+ organization setup through App Core  
Audience: design partners and Isonia operators

## Purpose

This guide explains how to use App Core to create and verify a Simple DAO+
organization in a v0.5 Design Partner Alpha environment.

The setup flow is intentionally guided, but it is not an authority layer:

```txt
Browser draft/template
  -> reviewable setup actions
  -> wallet-signed protocol transactions
  -> contract events
  -> Control Plane indexing/projection
  -> REST read models
  -> App Core verification
```

Templates generate a reviewable transaction plan. Drafts, warnings, previews,
diagnostics, and indexed read models help operators understand the setup, but
only successful on-chain contract transactions create governance authority.

Do not use this alpha flow for mainnet authority, production assets, production
treasury controls, or high-stakes governance decisions.

## Before You Begin

Confirm the target environment with Isonia before creating an organization.
v0.5 supports local development environments and one agreed shared public EVM
testnet environment. It does not target mainnet.

Required prerequisites:

- A local or shared testnet environment is selected and documented.
- `GovCore` and `GovProposals` contracts are deployed for that environment.
- Control Plane is running and configured for the same chain and contract
  addresses.
- App Core runtime config points to the same Control Plane API, chain ID, RPC
  URL, and contract addresses.
- The connected wallet is on the correct chain.
- Runtime feature flags needed for setup writes are enabled:
  `features.writeActions` and `features.manageOrg`.
- The setup signer is expected to have authority for the setup action being
  submitted. Frontend checks are hints only; the contracts make the final
  authority decision.

Useful checks before opening the setup UI:

```txt
GET /v1/health
GET /v1/version
GET /v1/diagnostics
GET /v1/diagnostics/indexer
```

`/v1/version` and `/v1/diagnostics` should report the same chain ID and contract
addresses that App Core uses in `isonia.config.json`.
`/v1/diagnostics/indexer` should show fresh `running` statuses for the API,
indexer, and projection worker in local development.

For local environment setup, see the archived
[Local End-to-End Demo](../v0.1/local-e2e-demo-v0.1.md).
For the diagnostics response shape, see
[REST API Spec - Diagnostics response](../v0.1/api-rest-v0.1.md#diagnostics-response)
and [Control Plane Spec - Diagnostics DTO](../v0.1/control-plane-spec-v0.1.md#123-diagnostics-dto).

## Open the Setup Flow

1. Open App Core.
2. Navigate to `/orgs/new`.
3. Connect the wallet that should submit setup transactions.
4. Confirm that the app shell does not show a wrong-chain or stale-data warning.
5. Select `Simple DAO+`.

If App Core reports that setup writes are disabled, confirm that runtime config
enables both `features.writeActions` and `features.manageOrg`, then reload the
app.

## Fill Simple DAO+ Inputs

The Simple DAO+ template creates a starting governance topology with:

- General Council for broad governance approval.
- Treasury Committee for treasury-specific review and execution.
- Security Council for veto coverage and emergency authority.

Fill the required setup inputs:

- Organization name.
- Optional organization metadata URI.
- Organization admin address.
- General Council holder addresses.
- Treasury Committee holder addresses.
- Security Council holder addresses.
- Executor holder or executor body choices where the UI asks for them.
- Timelock values for the enabled proposal routes.

Review addresses carefully. Empty addresses, invalid EVM addresses, and the zero
address should be treated as setup blockers for real design partner use.

The organization admin address is separate from any template-created body role.
It is the protocol-level authority where the contracts define it as such. A
`BodyAdmin` role in a generated body does not silently replace the organization
admin.

## Review Draft Actions

After the form generates the draft, review every action before submitting any
transaction.

The Simple DAO+ draft should show setup actions in this order:

1. `create_organization`
2. `create_body`
3. `create_role`
4. `assign_mandate`
5. `set_policy_rule`

Each action should show the values that will be written on-chain, including
addresses, body kinds, role types, mandate scopes, policy route bodies,
timelocks, and enabled state.

Expected policy routes usually include:

| Proposal type | Expected shape |
| --- | --- |
| `standard` | General Council approval, Security Council veto, configured executor body, short alpha timelock |
| `treasury` | General Council and Treasury Committee approvals, Security Council veto, Treasury Committee executor, longer alpha timelock |
| `upgrade` | General Council approval, Security Council veto, configured executor body, longer alpha timelock |
| `emergency` | Security Council approval and veto, Security Council executor, short or zero alpha timelock if intentionally enabled |

These routes are a starting point, not a governance recommendation. Confirm that
the design partner intentionally wants every enabled route.

## Resolve Validation Warnings

Validation warnings are advisory checks over the draft and indexed state. They
help prevent broken setup, but they do not define authority.

Resolve error-level warnings before submitting transactions. Review warning-level
items with the design partner and keep a note of any intentionally accepted
alpha risk.

Common warnings include:

- `invalid_address`
- `zero_address_authority`
- `missing_approver_mandate`
- `missing_veto_mandate`
- `missing_executor_mandate`
- `policy_route_without_eligible_holder`
- `invalid_timelock`
- `empty_required_approvals`
- `proposal_type_scope_mismatch`
- `missing_action_dependency`

For setup to be useful, every enabled policy route should have at least one
eligible holder for each required responsibility: approval, veto, and execution
where execution is expected.

## Execute Setup Transactions

Submit setup actions one at a time. Do not skip the indexing wait between action
groups, because later actions depend on real indexed IDs from earlier actions.

### 1. Create Organization

Submit the `create_organization` action.

Expected sequence:

1. App Core asks the connected wallet to sign.
2. The transaction is submitted.
3. App Core waits for the receipt and configured confirmation depth.
4. App Core waits for Control Plane indexing and projection.
5. App Core resolves the real `orgId` from indexed read models.

Do not proceed to dependent actions until the organization is indexed.

### 2. Create Bodies

Submit each `create_body` action for the generated bodies.

Expected result:

- General Council has a real indexed `bodyId`.
- Treasury Committee has a real indexed `bodyId`.
- Security Council has a real indexed `bodyId`.

If any body does not resolve to an indexed read model, stop and troubleshoot
before creating roles.

### 3. Create Roles

Submit each `create_role` action.

Expected roles include combinations of:

- `BodyAdmin`
- `Proposer`
- `Approver`
- `Executor`
- `Vetoer`
- `EmergencyOperator`

Use the canonical `EmergencyOperator` role name. Do not use an
`EmergencyPauser` alias.

### 4. Assign Mandates

Submit each `assign_mandate` action.

Review every mandate before signing:

- holder address;
- role;
- start time;
- end time;
- proposal type scope;
- spending limit, where relevant.

Mandates are what make holders eligible for route responsibilities. A policy
route that references a body is not complete if that body has no active holder
with the required mandate for the relevant proposal type.

### 5. Set Policy Rules

Submit each `set_policy_rule` action.

Review:

- proposal type;
- required approval bodies;
- veto bodies;
- executor body;
- timelock seconds;
- enabled state.

After indexing, each policy rule should have an indexed policy version. New
proposals snapshot the active policy version when they are created. Existing
proposals must continue using their stored `policyVersion`; do not expect a
later policy edit to rewrite old proposal routes.

## Wait for Indexing After Each Action

After every submitted transaction, App Core should wait through these states:

```txt
wallet pending
submitted
confirming
confirmed, waiting for indexer
indexed
```

The final verification must come from the relevant indexed read model, not from
diagnostics alone. Diagnostics explain lag; read models prove that the expected
organization, body, role, mandate, or policy is visible to App Core.

If the UI appears stuck after confirmation, open `/diagnostics` in App Core or
call `GET /v1/diagnostics` directly.

## Verify Completion Summary

When all setup actions have been submitted and indexed, review the completion
summary in App Core.

The summary should confirm:

- total setup actions;
- indexed action count;
- unresolved dependencies, if any;
- failed or blocked actions, if any;
- resolved `orgId`;
- indexed bodies;
- indexed roles;
- indexed mandates;
- indexed policies and policy versions.

Then open the created organization:

```txt
/orgs/<orgId>
/orgs/<orgId>/setup
/orgs/<orgId>/governance
/orgs/<orgId>/policies
/orgs/<orgId>/graph
```

Verify that:

- the organization appears with the expected admin and metadata or fallback
  label;
- the body, role, and mandate tables match the reviewed Simple DAO+ draft;
- policy routes are visible for the enabled proposal types;
- the governance graph reflects the configured topology;
- diagnostics do not report indexer lag, projection backlog, or contract config
  mismatch for the target environment.

## Readiness States

App Core uses setup completion readiness states to summarize whether the
expected indexed result has caught up with the transaction plan.

| State | Meaning | Operator action |
| --- | --- | --- |
| `not_started` | No expected setup action has reached indexed read-model state yet. | Start with the first unsubmitted action, or check whether the draft is attached to the correct environment. |
| `in_progress` | At least one setup transaction is waiting for wallet signing, confirmation, indexing, or projection. | Wait, then check diagnostics if the state does not advance. |
| `partially_indexed` | Some read models are indexed, but the full expected Simple DAO+ topology is not complete. | Continue remaining actions or troubleshoot missing indexed entities. |
| `blocked` | A failed action, error-level validation warning, or blocked dependency prevents completion. | Fix the blocking issue before submitting dependent actions. |
| `completed` | Every expected setup action has a corresponding indexed read-model result. | Review the organization screens and proceed to low-risk proposal lifecycle validation. |

## Troubleshooting

### Wallet Wrong Chain

Symptoms:

- App Core shows `Wrong chain`.
- Wallet chain ID differs from runtime config.
- Transactions are unavailable or fail before submission.

Actions:

- Switch the wallet to the chain shown by App Core runtime config.
- Confirm `chainId` and `rpcUrl` in `isonia.config.json`.
- Confirm `GET /v1/version` reports the same chain ID.
- For local development, the expected Hardhat chain ID is usually `31337`.

### Indexer Delay

Symptoms:

- Transaction is confirmed in the wallet.
- App Core remains in `confirmed, waiting for indexer`.
- The expected entity is not visible in organization read models.

Actions:

- Open `/diagnostics` or call `GET /v1/diagnostics`.
- Call `GET /v1/diagnostics/indexer` and confirm the indexer and projection
  worker are `running`.
- Compare latest safe block with the transaction block.
- Check per-contract last scanned blocks for `GovCore` and `GovProposals`.
- In local development, run `pnpm dev` from `control-plane`; it starts the REST
  API, continuous indexer, and continuous projection worker together.
- In a shared testnet environment, ask the Isonia operator to check the indexer
  process and RPC availability.

### Projection Backlog

Symptoms:

- Diagnostics show raw events have been observed or confirmed.
- Projection backlog is non-zero.
- Read model rows are missing or stale.

Actions:

- Check `projectionBacklog`, failed projection count, and latest projection
  error in diagnostics.
- Run or restart `pnpm dev` in the local `control-plane` environment.
- In shared testnet, ask the operator to inspect the projection worker logs.
- Do not manually patch the database to mark setup complete.

### Missing Indexed Entity

Symptoms:

- A transaction is confirmed and some later actions are blocked.
- Completion summary reports `missing_indexed_entity`.
- A body, role, mandate, or policy cannot be matched to the draft action.

Actions:

- Confirm Control Plane is indexing the same contract addresses used by App
  Core.
- Confirm the transaction was sent to the expected chain.
- Check whether the read model exists under a different organization ID.
- Re-run `pnpm dev` locally, or ask the shared testnet operator to inspect
  indexing state.
- If the transaction reverted, treat it as a failed transaction rather than a
  missing indexed entity.

### Failed Transaction

Symptoms:

- Wallet or App Core reports a failed transaction.
- The setup action state is `failed`.
- Dependent actions remain blocked.

Actions:

- Read the displayed error or revert reason.
- Confirm the connected signer has the required authority.
- Confirm the action values are valid and warnings have been addressed.
- Retry only when it is safe to submit the same intended action again.
- Do not mark dependent actions complete unless the expected on-chain event has
  been indexed.

### Policy Not Visible

Symptoms:

- Bodies, roles, and mandates are indexed.
- A policy route is not visible in App Core.
- Completion summary reports an unresolved policy rule.

Actions:

- Confirm the `set_policy_rule` transaction was submitted and confirmed.
- Check `GET /v1/orgs/<orgId>/policies` if available in the environment.
- Confirm the route uses resolved indexed body IDs, not draft IDs.
- Check diagnostics for projection backlog or projection failures.
- Confirm the policy was set for the expected proposal type and organization.
- If proposal route explanation reports `policy_snapshot_missing`, do not fall
  back to the latest policy. Investigate the missing indexed policy version.

## After Setup

Once the setup summary is `completed`, run a low-risk validation proposal before
the design partner relies on the organization for any meaningful decision.

Recommended validation:

- create a proposal through App Core;
- verify the proposal's `policyVersion`;
- review route explanation;
- approve with the expected holder;
- test veto where the route allows veto;
- queue if timelock is required;
- execute only a supported alpha execution path;
- confirm status updates after indexing and projection.

Keep the trial framed as Design Partner Alpha. Record friction, missing
diagnostics, confusing warnings, wallet issues, and route misunderstandings as
v0.5 feedback rather than treating them as production incidents.

## Related Docs

- [v0.5 Design Partner Alpha Plan](design-partner-alpha-plan.md)
- [v0.5 Setup and Template Architecture](setup-and-template-architecture.md)
- [REST API Spec - Diagnostics response](../v0.1/api-rest-v0.1.md#diagnostics-response)
- [Control Plane Spec - Diagnostics DTO](../v0.1/control-plane-spec-v0.1.md#123-diagnostics-dto)
- [Event Processing Spec - Diagnostics](../v0.1/event-processing-v0.1.md#diagnostics)
- [Local End-to-End Demo](../v0.1/local-e2e-demo-v0.1.md)
