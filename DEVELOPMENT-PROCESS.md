# IsoniaOS Development Process

**Status:** Draft  
**Prepared date:** 2026-05-05  
**Primary tooling assumption:** Codex-assisted development with human review

---

## 1. Process Principle

IsoniaOS should be developed docs-first.

Governance infrastructure is sensitive. Product scope, authority model, trust boundaries, and user expectations must be clear before implementation.

Repository docs are the durable source of truth for Codex and contributors. Chat history and project memory may guide a task, but future tasks must not rely on them as durable policy. New constraints that affect work across repositories should be recorded in active docs before they are assumed by implementation, release, or demo-stack tasks.

Future Codex tasks should inspect repository state and the active docs before changing code or process. Archived docs and prior chat context are supporting context only unless an active doc explicitly carries the decision forward.

Recommended process:

```text
Docs -> Issue -> Codex Task -> Patch -> Tests -> Human Review -> Merge -> Changelog
```

---

## 2. Active Context

Before any implementation work, read:

- `AGENTS.md`
- `WHITEPAPER.md`
- `ROADMAP.md`
- `ARCHITECTURE.md` for product architecture scope;
- `TOKENOMICS.md`, `GOVERNANCE.md`, `IDENTITY.md`, `TREASURY.md`, `LEGAL_ROADMAP.md`, `RISK_REGISTER.md`, `DECISION_LOG.md`, and `ISO_ARCHITECTURE.md` when ISO tokenomics, governance, identity, treasury, legal, risk, decision, or token architecture scope is involved;
- `v0.8/README.md`
- `v0.8/execution-discipline-and-beta-readiness.md`
- relevant feature docs under `v0.8/`
- relevant strategy docs under `strategy/`

Archived docs are historical context only. v0.8 is the active accountability/product implementation baseline. Draft v0.2 is the parallel ISO funding and protocol self-governance design baseline.

---

## 3. Codex Task Rules

Codex tasks should be small and reviewable.

A good Codex task has:

- one clear objective;
- explicit files to inspect;
- explicit files allowed to change;
- explicit non-goals;
- expected tests or checks;
- expected docs updates;
- no hidden production claims.

Avoid tasks like:

```text
Implement the v0.8 roadmap.
```

Prefer tasks like:

```text
Implement AddressInput checksum validation in app-core and add tests. Do not change setup wizard flow yet.
```

---

## 4. Codex Prompt Template

```text
You are working on IsoniaOS.

Active target: v0.8 accountability and integration preview for product implementation tasks. Use Draft v0.2 ISO funding and protocol self-governance design only if the task touches ISO, reserve, treasury, identity, Council, legal phasing, risk, or token architecture.

Read first:
- AGENTS.md
- docs/WHITEPAPER.md
- docs/ROADMAP.md
- docs/ARCHITECTURE.md when product architecture is relevant
- docs/TOKENOMICS.md, docs/GOVERNANCE.md, docs/IDENTITY.md, docs/TREASURY.md, docs/LEGAL_ROADMAP.md, docs/RISK_REGISTER.md, docs/DECISION_LOG.md, and docs/ISO_ARCHITECTURE.md when ISO design is relevant
- docs/v0.8/README.md when relevant
- [specific feature doc]

Task:
[one precise task]

Allowed changes:
- [files/packages]

Do not change:
- archive docs
- unrelated packages
- production SaaS billing
- custom domains
- full IPFS upload service
- Safe integration
- multi-chain execution
- NFT voting runtime
- production-grade indexer
- AI arbitration
- AI governance
- production audit readiness
- full Proposal Action Builder production release
- tenant provisioning

Acceptance criteria:
- [specific behavior]
- [tests/checks]
- [docs/changelog update if needed]

Report:
- files changed
- tests run
- unresolved questions
- known limitations
```

---

## 5. Branching and Pull Requests

Recommended branch names:

- `docs/...`
- `feat/v0.8-...`
- `fix/v0.8-...`
- `chore/v0.8-...`

Recommended PR shape:

- short summary;
- linked docs/spec;
- what changed;
- what did not change;
- screenshots for UI;
- tests/checks run;
- known limitations;
- follow-up tasks.

## 6. Pre-Beta Release Discipline

Before public beta, IsoniaOS may move in coherent implementation waves instead of tagging every commit. Create tags only after a complete scope or wave is validated and intentionally prepared for release.

Codex tasks should be specific enough to avoid missed details, but they should not force every small commit into a tagged release. After public beta, shift toward smaller release steps with tighter validation, compatibility checks, and release notes.

---

## 7. Review Gates

Before merge, verify:

- scope matches active docs;
- no out-of-scope v0.8 features introduced;
- package boundaries remain clean;
- public app-core does not include SaaS-only logic;
- UI uses theme tokens where appropriate;
- errors are specific, not generic;
- diagnostics distinguish chain/indexer/projection/API/config/wallet issues;
- tests/checks are run or limitations are documented;
- changelog updated where appropriate.

---

## 8. Documentation Gate

Docs must be updated when behavior changes.

Update:

- feature doc under `v0.8/`;
- `CHANGELOG.md` under Unreleased;
- compatibility matrix after tags exist;
- troubleshooting docs when new failure modes are discovered;
- strategy docs only when positioning or roadmap changes.

Do not edit archived docs unless explicitly instructed.

---

## 9. Changelog Style

Use `CHANGELOG.md` under `Unreleased` until a version is cut.

Categories:

- Added
- Changed
- Fixed
- Removed
- Deprecated
- Security

Do not create release sections unless a release is actually being prepared.

---

## 10. Test and Check Expectations

For code changes, run relevant checks.

Examples:

- TypeScript type checks;
- unit tests;
- component tests;
- contract tests;
- linting;
- local demo smoke test;
- API endpoint checks;
- indexer/projection checks.

If a check cannot be run, report why.

---

## 11. Human Review Responsibilities

Codex can propose patches, but humans must review:

- governance logic;
- authority model;
- security assumptions;
- smart contract changes;
- upgradeability;
- proposal/execution semantics;
- public wording;
- production claims;
- AI outputs or prompts;
- release tags.

Do not merge agent-generated changes into critical governance code without human review.

---

## 12. Source Notes for Codex

OpenAI describes Codex as a coding agent that can read, edit, and run code, and cloud tasks run in sandboxed environments. OpenAI also emphasizes that users should manually review and validate agent-generated code before integration and execution.

References:

- https://openai.com/index/introducing-codex/
- https://platform.openai.com/docs/codex/overview
- https://help.openai.com/en/articles/11369540-codex-in-chatgpt

---

## 13. Definition of Done for v0.8 Tasks

A v0.8 task is done when:

- it satisfies the relevant doc;
- it stays within v0.8 scope;
- it has tests or clearly documented manual verification;
- it updates docs/changelog if behavior changed;
- it does not add hidden SaaS, AI governance, production, or out-of-scope integration work;
- it is understandable to a reviewer;
- it does not degrade local demo readiness.
