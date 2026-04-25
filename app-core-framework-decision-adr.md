# ADR — App Core Framework Decision

## Status

Accepted for v0.1.

## Context

IsoniaOS has two frontend surfaces:

1. `isonia-web` — public website for `isonia.org`.
2. `isonia-app-core` — governance application core for self-hosted and SaaS usage.

The website needs SEO, SSR/SSG, whitepaper pages, blog/docs and marketing content.

The app core is an interactive dashboard driven by wallet connection, REST API, governance state, user actions, runtime config and themes.

## Decision

Use:

```txt
isonia-web      => Next.js
isonia-app-core => React + Vite SPA
```

## Rationale

React + Vite for App Core gives:

- simpler self-hosted deployment;
- static build that can be served by any web server/CDN;
- fewer SSR/wallet-state issues;
- easier runtime config injection;
- easier theme package replacement;
- faster local development;
- less framework-specific coupling.

Next.js remains the right choice for `isonia-web` because SEO and SSR/SSG matter for public content.

## Consequences

- App Core must be designed as a static SPA.
- Runtime config must be loaded at runtime, not hardcoded only at build time.
- SaaS frontend must extend App Core instead of reimplementing it.
- Theme packages must be compatible with React + Vite.
- `isonia-web` remains separate from product application code.

## Revisit conditions

Reconsider Next.js for App Core only if:

- SaaS requires server-rendered authenticated pages;
- public org pages require SEO;
- plugin system requires server-side composition;
- deployment strategy changes substantially.
