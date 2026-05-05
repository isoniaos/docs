# IsoniaOS v0.6 Codex Task Prompts

**Milestone:** v0.6 alpha  
**Purpose:** Provide scoped prompts for Codex-assisted implementation and review.

Use these prompts as starting points. Adjust repository names and package paths as needed.

---

## Prompt 1 — Verify active docs context

```text
You are working on IsoniaOS docs.

Active target: v0.6 alpha.

Read first:
- AGENTS.md
- README.md
- VERSIONING.md
- v0.6/README.md
- v0.6/codex-implementation-rules.md

Task:
Review the docs repository for stale references that incorrectly describe v0.5 as the active docs path. Update only active navigation/versioning docs if needed.

Allowed changes:
- README.md
- VERSIONING.md
- CHANGELOG.md
- v0.6/README.md

Do not change:
- archive/v0.5
- archive/v0.1
- future-version docs
- package tags

Acceptance criteria:
- v0.6 is consistently described as active.
- v0.5 is consistently described as archived.
- CHANGELOG.md is updated under Unreleased if changes are made.
```

---

## Prompt 2 — Review Address Components implementation

```text
You are working on IsoniaOS v0.6 alpha.

Read first:
- AGENTS.md
- docs/v0.6/README.md
- docs/v0.6/scope-and-non-goals.md
- docs/v0.6/address-components.md

Task:
Review the current AddressAvatar, AddressDisplay, AddressInput, MultiAddressInput, and AddressChip implementation against the v0.6 address components spec. Fix gaps only within the address component scope.

Allowed changes:
- app-core address components
- app-core address utilities
- relevant tests
- docs/v0.6/address-components.md if behavior differs intentionally
- CHANGELOG.md if needed

Do not change:
- setup wizard flow
- protocol contracts
- SaaS logic
- token voting
- delegation
- AI features

Acceptance criteria:
- MultiAddressInput supports paste separators: newline, comma, semicolon, space, tab.
- Duplicate normalized addresses are handled consistently.
- Invalid checksum addresses are rejected.
- Zero address is invalid for authority holder fields.
- Tests or documented manual checks exist.
```

---

## Prompt 3 — Setup Wizard UX review

```text
You are working on IsoniaOS v0.6 alpha.

Read first:
- AGENTS.md
- docs/v0.6/setup-wizard.md
- docs/v0.6/scope-and-non-goals.md

Task:
Review the Simple DAO+ setup wizard implementation. Ensure the wizard steps, review screen, validation categories, and execution handoff match the v0.6 spec.

Allowed changes:
- app-core setup wizard components
- shared setup wizard DTOs if already in scope
- tests
- docs/v0.6/setup-wizard.md if needed

Do not change:
- arbitrary custom governance template builder
- custom role taxonomy editor
- arbitrary calldata builder
- SaaS onboarding
- billing
- final theme customization

Acceptance criteria:
- Wizard has steps for template, identity, bodies, members/holders, policy routes, review, and execution.
- Review screen is human-readable.
- Warnings/errors/info are distinguished.
- Draft remains non-authoritative until explicit transactions.
```

---

## Prompt 4 — Setup Execution UX review

```text
You are working on IsoniaOS v0.6 alpha.

Read first:
- AGENTS.md
- docs/v0.6/setup-execution-ux.md
- docs/v0.6/diagnostics-panel.md

Task:
Review setup execution UX and make failures more specific. Ensure transaction, indexing, projection, config, and wallet issues are not reported as one generic error.

Allowed changes:
- app-core setup execution UI
- SDK endpoint typing if required
- Control Plane diagnostics response shape if already scoped
- tests
- docs updates

Do not change:
- protocol semantics
- production observability platform
- SaaS monitoring
- Safe integration

Acceptance criteria:
- Setup actions show pending/signing/submitted/mined/indexed/projected/completed/failed where data is available.
- Tx hashes are visible.
- Retry guidance exists for failed/timed-out actions.
- Indexing delay and projection delay are distinguishable.
```

---

## Prompt 5 — Proposal Lifecycle Demo polish

```text
You are working on IsoniaOS v0.6 alpha.

Read first:
- AGENTS.md
- docs/v0.6/proposal-lifecycle-demo.md
- docs/v0.6/design-partner-demo.md

Task:
Polish the local proposal lifecycle demo so a user can create a Simple DAO+ proposal, understand the route, approve/veto/queue/execute it, and verify final state.

Allowed changes:
- app-core proposal screens
- local demo helpers
- Hardhat local time helper integration for chainId 31337 only
- tests
- docs updates

Do not change:
- arbitrary calldata builder
- multi-target proposal builder
- token voting
- delegation
- Safe integration
- production execution automation

Acceptance criteria:
- Proposal detail screen shows required fields from the spec.
- Route explanation is visible and understandable.
- Contextual action buttons work.
- Local time controls appear only on chainId 31337.
- Final DemoTarget result is visible after execution.
```

---

## Prompt 6 — Diagnostics Panel hardening

```text
You are working on IsoniaOS v0.6 alpha.

Read first:
- AGENTS.md
- docs/v0.6/diagnostics-panel.md

Task:
Review and harden the diagnostics panel so developers can distinguish API, chain, contract config, indexer, projection, frontend config, and wallet issues.

Allowed changes:
- Control Plane diagnostics endpoints
- SDK diagnostics helpers
- app-core diagnostics route
- tests
- docs updates

Do not change:
- production observability platform
- alerting
- SaaS monitoring
- private admin dashboard

Acceptance criteria:
- Diagnostics sections exist for system, contracts, indexer, projections, frontend, and troubleshooting.
- Mismatch/stale states are visible.
- Common failures have direct guidance.
```

---

## Prompt 7 — v0.6 alpha readiness review

```text
You are working on IsoniaOS v0.6 alpha.

Read first:
- AGENTS.md
- docs/v0.6/review-checklist.md
- docs/v0.6/README.md

Task:
Perform a v0.6 alpha readiness review. Do not implement large features. Produce a concise report of what passes, what fails, and what should be fixed before the next alpha tag.

Allowed changes:
- optional docs-only corrections if clearly safe

Do not change:
- product code unless explicitly asked in a follow-up task
- tags
- archived docs
- future-version docs

Acceptance criteria:
- Report maps findings to checklist sections.
- Out-of-scope features are flagged.
- Recommended follow-up tasks are small and scoped.
```

---

## Prompt 8 — First integration preview planning

```text
You are working on IsoniaOS strategy and planning.

Read first:
- AGENTS.md
- ROADMAP.md
- strategy/INTEGRATION-STRATEGY.md
- strategy/ACCOUNTABILITY-MODEL.md

Task:
Draft an implementation plan for v0.7 Integration Preview. Do not write code. Identify the smallest useful data model and UI changes to support linked/imported external resources for Snapshot, Safe, Tally/Agora, Discourse, GitHub, and block explorer evidence.

Allowed changes:
- docs only

Do not change:
- app code
- contracts
- tags
- production claims

Acceptance criteria:
- Plan separates Level 0 links from Level 1 imports.
- Plan defines trust boundaries and stale/error states.
- Plan keeps execution automation out of scope.
```
