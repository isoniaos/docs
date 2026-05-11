# IsoniaOS v0.6 Review Checklist

**Milestone:** v0.6 alpha  
**Purpose:** Determine whether v0.6 is ready to show as a usable governance console alpha.

---

## 1. Scope Check

- [ ] v0.6 docs are active.
- [ ] v0.5 docs are archived and not edited as active docs.
- [ ] No SaaS billing added.
- [ ] No tenant management added.
- [ ] No production deployment claims added.
- [ ] No smart contract audit claims added.
- [ ] No Safe integration added.
- [ ] No delegation added.
- [ ] No token-weighted voting added.
- [ ] No multi-chain production indexing added.
- [ ] No AI assistant added.
- [ ] No custom private Git theme loading added.
- [ ] No final brand/marketing redesign added.

---

## 2. Repository Preparation

- [ ] Root README points to v0.6 docs.
- [ ] `VERSIONING.md` says v0.6 is active.
- [ ] `CHANGELOG.md` has Unreleased entries.
- [ ] v0.5 compatibility matrix remains archived.
- [ ] Codex rules are present and current.
- [ ] No active-looking obsolete docs remain in root navigation.

---

## 3. UI Foundation

- [ ] Reusable base UI components exist.
- [ ] Theme tokens are used where appropriate.
- [ ] Loading states are consistent.
- [ ] Empty states are consistent.
- [ ] Error states are consistent.
- [ ] Warning states are consistent.
- [ ] Success states are consistent.
- [ ] Governance-specific components are separated from generic UI primitives.

---

## 4. Address Components

- [ ] AddressAvatar exists.
- [ ] AddressDisplay exists.
- [ ] AddressInput exists.
- [ ] MultiAddressInput exists.
- [ ] MultiAddressInput supports paste of newline/comma/semicolon/space/tab separated addresses.
- [ ] Duplicate addresses are handled consistently.
- [ ] Invalid checksum addresses are rejected.
- [ ] Zero address is invalid for authority holder fields.
- [ ] ENS behavior is documented if unsupported or optional.

---

## 5. Setup Wizard

- [ ] Simple DAO+ template is available.
- [ ] Planned/locked templates are clearly marked if shown.
- [ ] Organization identity step exists.
- [ ] Governance bodies step exists.
- [ ] Members/holders step uses MultiAddressInput.
- [ ] Policy routes step explains approvals, vetoes, executor, and timelock.
- [ ] Review setup draft screen exists.
- [ ] Warnings, errors, and assumptions are distinguishable.
- [ ] Setup draft remains browser-side until transactions are sent.
- [ ] User can understand the setup before execution.

---

## 6. Setup Execution UX

- [ ] Setup actions are visible action-by-action.
- [ ] Pending state exists.
- [ ] Signing state exists.
- [ ] Submitted state exists.
- [ ] Mined state exists.
- [ ] Indexed state exists.
- [ ] Projected state exists.
- [ ] Completed state exists.
- [ ] Failed state exists.
- [ ] Tx hashes are visible.
- [ ] Indexing delay is distinguishable from chain failure.
- [ ] Projection delay is distinguishable from indexing delay.
- [ ] Retry guidance exists for common failures.

---

## 7. Proposal Lifecycle Demo

- [ ] User can create a proposal.
- [ ] Proposal detail screen shows proposal id.
- [ ] Proposal detail screen shows organization id.
- [ ] Proposal detail screen shows proposal type.
- [ ] Proposal detail screen shows status.
- [ ] Proposal detail screen shows creator.
- [ ] Proposal detail screen shows target.
- [ ] Proposal detail screen shows value.
- [ ] Proposal detail screen shows data hash.
- [ ] Route explanation is visible.
- [ ] Required approvals are visible.
- [ ] Veto bodies are visible where applicable.
- [ ] Executor body is visible.
- [ ] Timelock is visible.
- [ ] Approve action works.
- [ ] Veto action works where route allows.
- [ ] Queue action works where timelock applies.
- [ ] Execute action works.
- [ ] Cancel action works where applicable.
- [ ] Local Hardhat time controls appear only on chainId 31337.
- [ ] Final proposal state is visible.
- [ ] DemoTarget result is visible after execution.

---

## 8. Diagnostics

- [ ] `/diagnostics` route exists.
- [ ] API status is shown.
- [ ] API version/package version is shown where available.
- [ ] Configured chain id is shown.
- [ ] Latest block is shown.
- [ ] Safe block is shown where applicable.
- [ ] Contract addresses are shown.
- [ ] Contract/config mismatch warnings exist.
- [ ] Indexer status is shown.
- [ ] Last indexed block is shown.
- [ ] Failed event count is shown where available.
- [ ] Projection status is shown.
- [ ] Projection backlog is shown where available.
- [ ] Frontend runtime config source is shown.
- [ ] API base URL is shown.
- [ ] Connected wallet address is shown.
- [ ] Wallet chain is shown.
- [ ] Troubleshooting guidance exists.

---

## 9. Developer Experience

- [ ] Quickstart works from a clean clone.
- [ ] Local demo script exists or is documented.
- [ ] Common local failures are documented.
- [ ] Hardhat node restart/stale address issue is documented.
- [ ] Wallet wrong chain issue is documented.
- [ ] Indexer stale issue is documented.
- [ ] Projection backlog issue is documented.
- [ ] API unreachable issue is documented.
- [ ] Tests/checks are documented.

---

## 10. Design Partner Readiness

- [ ] Demo script exists.
- [ ] Demo story is understandable to DAO operators.
- [ ] Demo does not require reading source code.
- [ ] Demo explains what IsoniaOS is not.
- [ ] Demo ends with next steps: integrations and accountability dashboard.
- [ ] Feedback questions are prepared.
- [ ] Non-production limitations are clear.

---

## 11. Release Readiness

- [ ] Changelog updated.
- [ ] Known limitations documented.
- [ ] Compatibility matrix updated only if tags exist.
- [ ] No tags created unless explicitly instructed.
- [ ] No future-version docs created accidentally.
- [ ] Human reviewer has inspected Codex-generated changes.

---

## 12. Pass Criteria

v0.6 is ready for alpha demo when:

- a clean local run can complete the Simple DAO+ setup and proposal lifecycle;
- a design partner can understand the value without reading source code;
- diagnostics make failures understandable;
- docs reflect current behavior;
- limitations are explicit;
- no out-of-scope features or claims slipped in.
