# App Core v0.7 Roadmap

## Purpose

App Core should support v0.7 protocol hardening without losing the calm and understandable v0.6 UX direction.

The user should understand whether an organization is still in bootstrap, active but not finalized, or finalized.

## UX principles

Preserve v0.6 principles:

- keep default screens product-focused;
- hide technical details behind disclosures or diagnostics;
- use the transaction modal for write flows;
- avoid fake data;
- avoid unsupported production claims;
- use calm warnings;
- explain disabled actions;
- use red `*` only for required fields.

## Activation updates

App Core should support both:

- serial activation as reliable fallback;
- contract-level typed batch activation when available.

Typed contract batch activation is the current v0.7 alpha baseline. EIP-5792 remains optional diagnostics/prototype behavior, not the default reliable path.

Recommended behavior:

1. detect typed batch support;
2. prefer typed batch for suitable setups;
3. fall back to serial activation when unsupported or too large;
4. keep EIP-5792 behind feature flag/diagnostics;
5. use transaction modal for all write flows.

## Finalization UX

After activation, App Core should guide the user toward finalization where deployed contracts and read models support it.

The finalization step should explain:

- what bootstrap admin can currently do;
- what changes after finalization;
- which actions become governance-controlled or blocked;
- whether finalization is irreversible.

Avoid fear-based language. Use clear accountability language.

For older contracts or incomplete read-model data, App Core should show `unsupported` or `not available` instead of faking finalized state. For compatible current alpha deployments, App Core may show the finalization transaction UX and post-finalization restrictions.

## Post-finalization restrictions

If an admin-only action is blocked after finalization, App Core should show:

- disabled button;
- reason text;
- link to relevant governance route if applicable.

Example message:

```text
This organization has finalized bootstrap. Governance structure changes now need to follow configured governance routes.
```

## Governance Structure page

The Governance Structure page should reflect:

- lifecycle state;
- finalization status;
- admin handoff state;
- bodies;
- roles;
- mandates;
- policy routes.

Do not show fake health scores.

Use real/indexed/modeled/needs-data states.

When finalization support exists, show a clear finalized state badge. When the organization is active but not finalized, show calm copy that bootstrap admin authority still exists.

## Diagnostics access

Diagnostics should remain available through the topbar indicator and `/diagnostics`.

Do not reintroduce large diagnostics buttons into normal product flows.

Waiting/failure states may include subtle diagnostics links.

## Proposal Action Builder design surface

v0.7 defines the Proposal Action Builder design baseline. A full production implementation is not required.

The future first MVP should support one EVM write call per proposal action. App Core should make the action understandable through progressive disclosure instead of making raw calldata the primary surface.

Expected future surfaces:

- action builder form;
- ABI paste/upload area;
- function selector;
- parameter editor;
- plain-language action preview;
- warning panel;
- advanced technical disclosure;
- hash preview;
- simulation status panel;
- final review step before proposal submission.

If any UI prototype is added in v0.7, label it clearly as design/prototype and avoid unsupported claims.

Do not implement or claim support for multi-call bundles, explorer import, Safe integration, provider simulation integration, or hidden late-bound execution values in the v0.7 App Core baseline.

## Compatibility behavior

For older contracts or unsupported Control Plane data:

- show `unsupported` or `not available`;
- avoid fake states;
- keep user-facing copy understandable;
- provide diagnostics link for technical detail.

## Implementation boundaries

Maintain current coding standards:

- TypeScript;
- React;
- Vite;
- Chakra UI isolated inside `src/ui-kit`;
- no direct Chakra imports outside `src/ui-kit`;
- Hugeicons through `IsoIcon`;
- React Flow only in governance-structure feature;
- UI components use `PascalCase.tsx`;
- hooks use `useSomething.ts`;
- helper modules use `kebab-case.ts`;
- directories use `kebab-case`.

## Sequencing

App Core finalization UI follows protocol, shared type, SDK, and Control Plane support. The current alpha stack is aligned where compatible.

Current order:

```text
typed batch activation baseline completed
  -> bootstrap finalization implemented across the current alpha stack
  -> downstream alignment exists across types/sdk/control-plane/app-core
  -> remaining work: docs alignment, clean demo-stack verification, Proposal Action Builder design, metadata/storage schemas, and design partner preview
```

## Open questions

- Should finalization be part of the activation wizard or a separate review screen?
- Should single-org tenant mode change the default home page in v0.7?
- How should lifecycle warnings appear in developer-demo mode versus normal customer mode?
- Should Governance Structure include an export/share affordance in v0.7 or later?
