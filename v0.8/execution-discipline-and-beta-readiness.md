# v0.8 Execution Discipline and Beta Readiness

## Purpose

This note records process decisions for the v0.8 accountability and integration preview track.

It is documentation and process guidance only. It does not implement runtime code, rename contracts, add tooling, change package versions, or create Git tags.

## Durable Source of Truth

Repository documentation is the durable source of truth for IsoniaOS contributors and Codex tasks.

Chat history and project memory may guide a task, but they are not a stable cross-repository contract. New constraints, scope boundaries, release discipline, and beta-readiness requirements that future tasks must rely on should be written into repository docs before being treated as project policy.

Future Codex tasks should inspect the current repository state and active docs before making changes. They should not assume that earlier chat context, old release notes, or archived documentation still describe the active plan.

## Demo-Stack Runtime Scope

For v0.8 runtime orchestration, `demo-stack` should directly track only:

- `app-core`;
- `control-plane`;
- `evm-contracts`.

`demo-stack` should not present `docs`, `types`, `sdk`, or `theme-default` as first-class top-level runtime package pins unless it truly consumes those repositories directly.

This does not mean those repositories are irrelevant:

- `types`, `sdk`, and theme packages may still be dependencies inside App Core or Control Plane;
- docs define architecture, scope, acceptance criteria, and release discipline;
- dependency versions should still be validated inside the repositories that consume them.

The boundary is about what `demo-stack` directly orchestrates. It should avoid top-level version variables, tasks, or compatibility rows for packages it does not directly run.

## Pre-Beta Tagging Discipline

Before public beta, v0.8 may move in larger implementation waves. Do not tag every commit.

Tags should be created only after a coherent scope or wave is complete, validated, and intentionally prepared for release. Codex implementation tasks should be scoped tightly enough to avoid missing important details, but not so narrowly that every small commit becomes a tagged release.

After public beta, the release process should shift toward smaller and more careful release steps with tighter validation, clearer release notes, and stronger compatibility checks.

These rules complement the SemVer and Git tag format rules in `VERSIONING.md`. They do not authorize changing package versions or creating tags unless a task explicitly requests release work.

## Deferred Contract Cleanup and Hardening Wave

Contract organization, refactor, coverage, gas reporting, and security review are required before public beta, but they are not the next runtime task.

This wave should happen late in the v0.8 roadmap, after the main Control Plane and App Core accountability/archive runtime surfaces are stable enough that refactors will not churn underneath active integration work. It should be treated as part of beta readiness alongside UI polish and docs/claims review.

Planned contract cleanup scope:

- keep all demo-only contracts under a demo-specific directory, for example `contracts/demo/`;
- keep mocks, such as a future mock USDC, under a mock-specific directory, for example `contracts/mocks/`;
- isolate demo and mock contracts from production/security claims and coverage requirements unless a test explicitly opts into them;
- rename legacy `Gov*` contract, module, and script naming to `Iso*` after dependent runtime work is stable;
- sort Solidity functions using the official Solidity visibility order: constructor, receive, fallback, external, public, internal, private, with `view` and `pure` last within each visibility group;
- add NatSpec to main contracts and demo contracts, especially public ABI surfaces;
- remove hardcoded version labels from Ignition modules, scripts, and similar code paths because Git tags carry release versions and code should represent the current version;
- add contract coverage reporting;
- add gas reporting;
- perform a strict security review or audit before public beta.

This is not a production audit claim. It is a beta-readiness requirement. Audit scope, provider, process, and final acceptance criteria can be defined later.

## Public Beta Readiness Gate

Before public beta or design-partner beta, the v0.8 roadmap must include a beta-preflight phase covering:

- contracts refactor and hardening;
- UI polish for the public archive, accountability dashboard, and demo flow;
- strict security review or audit with special scrutiny for authority, proposal execution, access control, and demo/mock isolation;
- docs and claims review to ensure the project does not overclaim production, SaaS, audit-ready, integration-complete, or tokenomics runtime readiness.

This gate should not block the current v0.8 runtime steps for Control Plane and App Core. It must remain visible as required late-v0.8 work before any public beta readiness claim.
