# IsoniaOS Documentation Update Manifest

**Prepared for:** `isoniaos/docs`  
**Current documentation target:** v0.7 alpha
**Purpose:** Track the documentation transition from the archived v0.6 baseline to the active v0.7 protocol-hardening line.

## Active documentation

Root:

- `README.md`
- `AGENTS.md`
- `WHITEPAPER.md`
- `ROADMAP.md`
- `VERSIONING.md`
- `CHANGELOG.md`
- `DEVELOPMENT-PROCESS.md`
- `DOCS_UPDATE_MANIFEST.md`

Strategy:

- `strategy/MARKET-ENTRY.md`
- `strategy/COMPETITIVE-LANDSCAPE.md`
- `strategy/INTEGRATION-STRATEGY.md`
- `strategy/ACCOUNTABILITY-MODEL.md`
- `strategy/TRUST-AND-SECURITY.md`
- `strategy/AI-POLICY.md`
- `strategy/SAAS-AND-OPEN-CORE.md`
- `strategy/TENANT-AND-DOMAIN-MODEL.md`
- `strategy/STORAGE-AND-IPFS-MODEL.md`
- `strategy/NARRATIVE-AND-MESSAGING.md`

v0.7:

- `v0.7/README.md`
- `v0.7/roadmap.md`
- `v0.7/protocol-roadmap.md`
- `v0.7/bootstrap-finalization.md`
- `v0.7/admin-batch-activation.md`
- `v0.7/proposal-action-builder.md`
- `v0.7/storage-and-metadata.md`
- `v0.7/control-plane-roadmap.md`
- `v0.7/app-core-roadmap.md`
- `v0.7/compatibility-matrix.md`
- `v0.7/design-partner-demo-plan.md`

## Review priorities

1. Confirm that `v0.7/` is the active documentation context.
2. Confirm that v0.6 is treated as an archived baseline, not the current target.
3. Confirm that v0.7 remains focused on protocol hardening: typed admin batch activation, bootstrap finalization/admin handoff, lifecycle state, Proposal Action Builder design, and metadata/storage schemas.
4. Confirm that serial activation remains the reliable fallback.
5. Confirm that typed contract-level admin batch activation is the v0.7 reliable optimization path.
6. Confirm that EIP-5792 remains gated/prototype/diagnostics only, not the primary path.
7. Confirm that v0.7 non-goals remain intact: no production SaaS billing, custom domains, full IPFS upload service, Safe integration, multi-chain execution, token-weighted voting, delegation, AI arbitration, production audit readiness, full Proposal Action Builder production release, or tenant provisioning.

## Main transition

The active line is now:

```text
v0.7 protocol hardening alpha
```

The v0.6 line is now:

```text
archived governance console alpha baseline
```
