# IsoniaOS v0.6 Scope and Non-Goals

## Scope

v0.6 focuses on usability, developer experience, and demo readiness.

The existing v0.5 foundation includes:
- EVM governance contracts;
- Control Plane REST API;
- event indexing and projections;
- shared types;
- SDK;
- App Core;
- default theme;
- documentation.

v0.6 should improve how these pieces are used together, especially in local development and design partner demonstrations.

## In scope

### App Core

- reusable UI components;
- address display and input components;
- multi-address chip input;
- setup wizard for Simple DAO+;
- setup draft review;
- setup execution progress;
- improved proposal lifecycle screens;
- diagnostics panel improvements;
- consistent loading, empty, error, warning, and success states.

### Theme Default

- basic component styling;
- design tokens for neutral, success, warning, danger, and accent states;
- address-specific visual treatment;
- layout primitives used by app-core.

### Control Plane

- diagnostics needed by app-core;
- projection/indexer visibility;
- stable local dev behavior;
- clear error shapes where app-core needs them.

### SDK

- typed access to Control Plane endpoints needed by app-core;
- path helpers;
- no UI code;
- no governance authority logic.

### Types

- shared DTOs and enums needed by app-core, SDK, and Control Plane;
- setup wizard DTOs if required;
- diagnostics DTOs if required.

### Docs

- active v0.6 docs;
- local quickstart;
- design partner demo script;
- troubleshooting;
- compatibility matrix after each tag set.

## Out of scope

The following must not be added to public app-core during v0.6:

- SaaS billing;
- Stripe or subscription plans;
- tenant management;
- platform admin UI;
- paid limits;
- usage metering;
- commercial onboarding;
- private SaaS workflows.

The following are also out of scope for v0.6:

- production deployment architecture;
- smart contract audit claims;
- AI assistant or AI arbitrator;
- Safe integration;
- delegation;
- token-weighted voting;
- multi-chain production support;
- custom theme loading from private Git repositories;
- final brand book;
- advanced graph visualization;
- arbitrary calldata builder.

## Public app-core boundary

app-core is a public, self-hostable governance console foundation.

It may include:
- runtime configuration;
- feature gates for public self-hosted capabilities;
- theme extension points;
- wallet connection adapters;
- neutral deployment-mode metadata.

It must not include SaaS-only business logic.

## Decision rule

If a feature is required only for IsoniaOS commercial hosting, it belongs in a future private SaaS repository, not in public app-core.
