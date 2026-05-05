# IsoniaOS v0.6 Documentation Set

Active target: IsoniaOS v0.6 alpha.

v0.6 turns the v0.5 Developer Preview into a coherent, usable governance console alpha. The goal is not to add every future governance feature, but to make the existing protocol, Control Plane, SDK, App Core, and theme foundation easier to understand, demonstrate, and extend.

A developer or design partner should be able to run IsoniaOS locally, create a Simple DAO+ organization, inspect its governance structure, create a proposal, route it through approval, veto, timelock, and execution, and understand what is happening without reading source code.

## Active documents

### v0.6 product scope

- [Roadmap](roadmap.md)
- [Scope and Non-Goals](scope-and-non-goals.md)
- [Design Partner Demo](design-partner-demo.md)
- [Review Checklist](review-checklist.md)

### v0.6 UI and UX

- [UI Foundation](ui-foundation.md)
- [Address Components](address-components.md)
- [Setup Wizard](setup-wizard.md)
- [Setup Execution UX](setup-execution-ux.md)
- [Proposal Lifecycle Demo](proposal-lifecycle-demo.md)
- [Diagnostics Panel](diagnostics-panel.md)

### v0.6 development process

- [Repository Preparation](repository-preparation.md)
- [Codex Implementation Rules](codex-implementation-rules.md)
- [Codex Task Prompts](codex-task-prompts.md)
- [Release Process](release-process.md)

## Strategic context

Read the root and strategy docs when making product decisions:

- [Whitepaper](../WHITEPAPER.md)
- [Roadmap](../ROADMAP.md)
- [Market Entry Strategy](../strategy/MARKET-ENTRY.md)
- [Integration Strategy](../strategy/INTEGRATION-STRATEGY.md)
- [Accountability Model](../strategy/ACCOUNTABILITY-MODEL.md)
- [Trust and Security](../strategy/TRUST-AND-SECURITY.md)
- [AI Policy](../strategy/AI-POLICY.md)

## Historical references

The v0.5 Developer Preview is closed and archived. Its known-good compatibility matrix must be preserved at:

```text
../archive/v0.5/compatibility-matrix.md
```

Codex and other coding agents must not update archived v0.5 materials unless explicitly asked to correct archival metadata.

## v0.6 Product Principle

```text
v0.6 should move IsoniaOS from “it works” to “it can be shown to a person and they can understand the value.”
```

## v0.6 Non-goals Reminder

v0.6 must not attempt to deliver:

- SaaS billing;
- tenant management;
- production deployment;
- smart contract audit readiness;
- Safe integration;
- delegation;
- token-weighted voting;
- multi-chain production indexing;
- AI governance assistant;
- custom theme loading from Git;
- final brand/marketing design.
