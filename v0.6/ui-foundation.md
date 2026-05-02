# IsoniaOS v0.6 UI Foundation

## Purpose

Create a reusable UI foundation for app-core and theme-default so future screens are built from consistent primitives rather than one-off markup.

This is not the final visual design. It is a component and interaction foundation that can be improved later.

## Design depth for v0.6

v0.6 should deliver:
- reusable components;
- consistent states;
- basic accessibility;
- predictable spacing and layout;
- clean governance-console aesthetics;
- design tokens that can be refined later.

v0.6 should not attempt:
- final brand polish;
- full marketing-grade design;
- complex animation system;
- advanced graph visualization;
- exhaustive responsive design for every page.

## Component groups

### Layout

- AppShell
- Page
- PageHeader
- Section
- Card
- CardHeader
- CardBody
- CardFooter
- Grid
- Stack
- Inline
- Divider

### Data and status

- Badge
- StatusBadge
- SeverityBadge
- StatCard
- EmptyState
- LoadingState
- ErrorState
- WarningCallout
- SuccessCallout
- InfoCallout

### Form controls

- Button
- IconButton
- Input
- Textarea
- Select
- Checkbox
- Field
- FieldLabel
- FieldDescription
- FieldError
- FormSection

### Governance-specific

- AddressAvatar
- AddressDisplay
- AddressInput
- MultiAddressInput
- AddressChip
- TransactionStatus
- IndexingStatus
- ProjectionStatus
- ProposalStatusBadge
- PolicyRouteBadge

## State model

Every reusable component should support the states that matter for governance operations:

- default;
- hover;
- focus;
- disabled;
- loading;
- success;
- warning;
- error;
- stale;
- pending;
- completed.

## Accessibility baseline

Components should:
- use semantic HTML where possible;
- expose visible focus states;
- associate labels with inputs;
- avoid color-only error communication;
- support keyboard removal of chips;
- provide tooltip content in a way that does not hide essential data from keyboard users.

## Styling principles

- Prefer theme tokens over hardcoded colors.
- Keep component APIs small.
- Keep governance-domain components separate from generic UI primitives.
- Do not duplicate the same visual pattern inside feature components.
- Avoid adding heavy UI dependencies unless clearly justified.

## Typography

Address-like values should use a mono font. The preferred font for address text is IBM Plex Mono.

Recommended address text defaults:
- font family: IBM Plex Mono or configured mono fallback;
- form/review context size: 16px;
- dense/table context size: 13px or 14px;
- letter spacing: 0.004em.

## Color intent

Recommended semantic color roles:
- neutral: slate / blue-gray;
- accent: teal / cyan;
- success: emerald;
- warning: amber;
- danger: red.

Exact color tokens can be refined later in theme-default.

## Deliverable for v0.6 alpha.1

The first UI foundation implementation should include:
- base Card, Button, Field, Input, Badge, Callout components;
- AddressAvatar, AddressDisplay, AddressInput, MultiAddressInput, AddressChip;
- documentation or examples for address components;
- replacement of raw setup holder textareas with MultiAddressInput.
