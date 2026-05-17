# IsoniaOS SaaS and Open-Core Model

**Status:** Draft  
**Prepared date:** 2026-05-05

---

## 1. Strategic Principle

Governance infrastructure requires trust, but the project also needs a sustainable business model.

IsoniaOS should be:

```text
Open where trust matters. Commercial where reliability, convenience, and intelligence matter.
```

This means the core governance logic, self-hostable app foundation, shared types, SDKs, and critical trust surfaces should be open where possible. Managed SaaS should monetize convenience, reliability, integrations, analytics, support, private deployment, and optional AI-assisted governance.

---

## 2. Why Open Core Matters

DAOs and public-good communities are skeptical of opaque governance infrastructure.

Open core helps users:

- inspect critical logic;
- self-host if needed;
- avoid vendor lock-in;
- verify governance flows;
- contribute improvements;
- build custom interfaces;
- trust the project more deeply.

For governance infrastructure, openness is not only a distribution strategy. It is a trust mechanism.

---

## 3. Public Open-Core Scope

The public open-core surface may include:

- EVM governance contracts;
- shared types;
- SDK;
- public App Core;
- default theme;
- basic Control Plane components;
- local development setup;
- self-hosting documentation;
- public governance archive;
- diagnostics;
- basic manual accountability tracking;
- basic integration interfaces;
- documentation and examples.

The public core should be usable without:

- SaaS billing;
- proprietary AI;
- private tenant management;
- hosted indexer;
- enterprise support;
- hidden platform services.

---

## 4. Managed SaaS Scope

Managed SaaS can provide:

- hosted organizations;
- managed database;
- managed indexer/projections;
- monitoring;
- backups;
- uptime guarantees later;
- custom domains;
- managed integrations;
- richer analytics;
- governance health reports;
- optional AI summaries and risk checklists;
- premium templates;
- support and onboarding;
- white-label/custom deployments;
- compliance-oriented exports later;
- private deployments for larger organizations later.

## 4.1 Public Beta SaaS Readiness Baseline

Managed SaaS is part of the public beta path, but public beta planning must not imply production SaaS readiness.

Before public beta readiness is claimed, the roadmap should define:

- hosted Control Plane and App Core deployment path;
- managed Postgres/indexer infrastructure direction;
- environment separation for dev, stage, and eventually production;
- custom domain direction without claiming custom domain implementation is complete;
- monitoring, logging, backups, and restore expectations;
- tenant and organization provisioning plan;
- integration credential management direction;
- open-core boundary between inspectable/self-hostable components and managed service conveniences.

This baseline is planning/spec unless a future implementation task explicitly scopes runtime SaaS infrastructure. Public App Core must remain useful for self-hosting and must not absorb SaaS-only billing, private tenant admin, or operator console logic.

---

## 5. What Must Not Leak Into Public App Core

Public App Core should not include SaaS-only business logic.

Do not add to public App Core:

- Stripe billing;
- subscription plan enforcement;
- tenant billing logic;
- usage metering;
- commercial limits;
- private SaaS workflows;
- platform admin console;
- customer pipeline logic;
- private enterprise onboarding.

Public App Core may include neutral runtime configuration and public feature gates if useful for self-hosting.

---

## 6. Revenue Model Options

### Hosted SaaS subscription

Monthly or annual pricing based on:

- number of organizations;
- number of active governance participants;
- number of proposals;
- integration depth;
- analytics features;
- AI usage;
- support tier.

### Design partner / pilot package

For early partners:

- setup and onboarding;
- custom workflow mapping;
- limited support;
- public case study option;
- reduced or waived fee in exchange for feedback.

### Enterprise / private deployment

For mature organizations:

- private hosting;
- custom integrations;
- dedicated support;
- compliance exports;
- data residency requirements;
- custom AI provider configuration.

### Governance process consulting

Later, IsoniaOS may offer:

- governance workflow design;
- policy route design;
- template configuration;
- migration from fragmented processes;
- accountability model design.

This should not distract from product development early.

---

## 7. Avoiding Open-Core Backlash

Open-core governance projects can lose trust if users feel the public version is crippled.

Avoid:

- hiding basic accountability behind SaaS;
- making self-hosting intentionally painful;
- using unclear licensing;
- locking export data;
- making AI mandatory;
- making integrations SaaS-only without reason;
- using public-good language while behaving like a closed vendor.

Prefer:

- honest boundaries;
- useful self-hosted core;
- managed convenience as paid value;
- transparent upgrade path;
- data export;
- clear licensing;
- public roadmap.

---

## 8. Suggested Feature Boundary

### Open core

- organization model;
- proposal lifecycle;
- basic roles;
- basic voting/approval primitives;
- setup wizard;
- public governance records;
- manual execution tracking;
- basic diagnostics;
- self-hostable app;
- basic external links;
- basic export.

### SaaS premium

- hosted infrastructure;
- managed indexing;
- managed integrations;
- custom domains;
- advanced analytics;
- AI governance digest;
- governance health reports;
- premium templates;
- advanced reports;
- customer support;
- private deployments.

### Enterprise later

- compliance exports;
- SSO;
- custom data retention;
- private model/provider configuration;
- custom plugins;
- service-level commitments;
- legal/procurement support.

---

## 9. SaaS Trust Requirements

Before SaaS launch, document:

- data collected;
- data retention;
- backup policy;
- uptime target;
- incident response;
- integration dependency risks;
- AI data usage;
- export path;
- support boundaries;
- privacy policy;
- terms of service.

---

## 10. Early Commercial Positioning

Early SaaS should not be sold as “pay us or your governance does not work.”

It should be sold as:

```text
Run IsoniaOS without managing infrastructure, integrations, monitoring, backups, and AI services yourself.
```

---

## 11. Later Civic/Institutional Implications

If IsoniaOS expands beyond Web3-native organizations, the SaaS model will need more mature capabilities:

- legal entities and contracts;
- accounting support;
- procurement readiness;
- data protection review;
- accessibility standards;
- audit logs;
- compliance exports;
- enterprise support;
- jurisdiction-specific requirements.

These are later-stage requirements and should not distort the DAO-first launch.
