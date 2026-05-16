# App Core v0.7 Design Guide

## Purpose

This guide records the current App Core UI direction for the v0.7 design partner preview.

The product should feel calm, sparse, and operational. App Core should help users understand governance authority without making normal flows look like diagnostic consoles.

## Core UI Direction

- Prefer clear hierarchy, whitespace, and short explanations over dense tables.
- Keep primary screens focused on the current user task.
- Use diagnostics and technical details as secondary surfaces.
- Treat blockchain and Control Plane state honestly: contracts remain authoritative, read models can lag, and the UI must not fake support.
- Keep copy concrete and non-hype.

## Steps and Wizards

Use `IsoSteps` for wizard and transaction progress surfaces.

Preferred behavior:

- vertical steps for setup, activation, and transaction modals;
- numbered markers for inactive steps;
- spinner marker for the active transaction step;
- connecting lines centered through the step markers;
- inactive step copy visually muted while markers remain legible;
- no heavy card frame around every step;
- no table-like review step unless the user is explicitly reviewing a data table.

Activation wizards should show only the current action group and the content needed to understand it. The current v0.7 activation flow is:

1. Bodies
2. Roles
3. Mandates
4. Policy routes
5. Finalization

Do not reintroduce a generic Review / Finish step in the primary activation path. Finalization should be a short message with one primary action when all required activation read models are indexed.

## Activation Content

The activation wizard should explain what will be created without exposing implementation tables by default.

Recommended format:

```text
The following bodies will be created:
1. General Council (Body #1)
   General organization approval and standard proposal review.
2. Treasury Committee (Body #2)
   Treasury proposal approval and treasury-specific review.
```

Mandate and policy route steps should put the conceptual explanation above the inputs. Validation should appear after the user interacts with a field and leaves it, not before.

Policy route cards should collapse to one column on narrower screens so form content remains readable.

## Transaction Modals

Use the transaction modal for write flows.

The modal should:

- keep the `Contracts remain authoritative` notice;
- show vertical transaction steps;
- preserve transaction hashes, diagnostics links, and raw errors where relevant;
- keep Close as an outline action on the left;
- keep the primary write action on the right;
- show spinner-only loading while preserving the original button width;
- show wallet/admin preflight failures as a red authority alert above the primary action.

Do not show a disabled primary text button such as `In progress` while a transaction is active.

## Breadcrumbs and Navigation

Use `IsoBreadcrumbs` for page hierarchy. Breadcrumbs should:

- start with Home;
- avoid bright blue link-like page-start text;
- use subtle icon separators;
- align with the page content edge.

After an organization is finalized, setup activation is no longer an active workspace task. App Core should:

- redirect from the finalization modal close to `/orgs/:orgId/governance`;
- hide `Setup / Activation` from the organization sidebar;
- return the setup activation route as not found for finalized organizations.

## Buttons

Buttons should use capitalized text without bold typography.

Use:

- primary blue for write actions;
- outline for Close, Back, and other secondary actions;
- icons for directional and execution actions where available through `IsoIcon`;
- spinner-only loading states where the action label would otherwise change width.

Back and Next wizard buttons should use `ArrowLeft01Icon` and `ArrowRight01Icon` through `IsoIcon`. Activation write actions should use `StartUp02Icon` through `IsoIcon`.

## Implementation Boundaries

- Keep Chakra UI imports isolated inside `src/ui-kit`.
- Use Hugeicons only through `IsoIcon`.
- Do not move protocol, SDK, or Control Plane behavior into UI components.
- Do not change contract or API behavior for visual polish.
- Prefer App Core wrappers first; promote component variants to `theme-default` only after the App Core pattern stabilizes.
