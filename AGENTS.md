# IsoniaOS Docs Repository Agent Rules

These rules apply to Codex and other AI agents working in this repository.

## Active target

The active documentation target is **IsoniaOS v0.6 alpha**.

Read first:

- `WHITEPAPER.md`
- `ROADMAP.md`
- `AGENTS.md`
- `DEVELOPMENT-PROCESS.md`
- `strategy/`
- `v0.6/`

Archived documents are historical references only.

## Product positioning rules

- Treat DAO/Web3 governance as the first market.
- Treat civic, public-sector, political, and state-level governance as a long-term expansion path, not immediate product scope.
- Describe IsoniaOS as a governance control plane / governance operating system for accountable digital organizations.
- Do not describe IsoniaOS as only a voting app, DAO launcher, treasury wallet, AI governor, or state operating system.
- Keep the core thesis visible: **Governance is not a vote. Governance is a lifecycle.**
- Keep the launch wedge visible: **IsoniaOS closes the loop between DAO decisions and execution.**

## v0.6 scope rules

v0.6 may improve:

- local demo readiness;
- setup wizard UX;
- proposal lifecycle demo;
- route explanation;
- setup execution UX;
- diagnostics;
- documentation and troubleshooting.

v0.6 must not add:

- SaaS billing;
- tenant management;
- production deployment claims;
- smart contract audit claims;
- Safe integration;
- delegation;
- token-weighted voting;
- multi-chain production indexing;
- AI assistant;
- AI arbitration;
- custom theme loading from private Git repositories;
- final brand/marketing design.

## Documentation rules

- Keep active docs in English.
- Keep user-facing statements concrete and non-hype.
- Do not make legal, audit, production-security, or compliance claims unless the supporting work exists.
- Update `CHANGELOG.md` under `Unreleased` when adding or changing docs.
- Do not edit `archive/v0.5/` or `archive/v0.1/` unless explicitly instructed.
- Do not create future-version docs unless the version is explicitly scoped.
- Do not create or update tags unless explicitly instructed.

## Implementation rules

- Prefer small, reviewable changes.
- Use docs as the source of truth before code.
- Do not merge unrelated protocol, UI, SaaS, AI, and integration work into one patch.
- Keep package boundaries clean.
- Run relevant tests, linters, or type checks when code changes.
- Report uncertainty, failing tests, or unverified assumptions.

## Trust rules

- Contracts are authoritative for onchain state.
- UI and diagnostics are explanatory layers, not sources of governance authority.
- Indexer/projection data must be treated as read models that can lag or fail.
- AI output is advisory by default and must not be presented as binding authority.
