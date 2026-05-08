# IsoniaOS Tenant and Domain Model

**Status:** Draft  
**Prepared date:** 2026-05-08

---

## 1. Purpose

This document records product and architecture guidance for SaaS tenants, self-hosted deployments, domain binding, multi-organization mode, and multi-chain organization contexts.

It describes intended product behavior and future milestones. It does not mean SaaS tenant infrastructure, custom domain verification, tenant isolation, or multi-chain execution is implemented today.

---

## 2. Core Principle

The normal customer experience should open into a specific organization workspace, not a global catalog of every organization known to IsoniaOS.

For most users, a domain should answer a simple question:

```text
Which organization workspace am I entering?
```

App Core may support multiple organizations technically, but customer-facing SaaS and most self-hosted deployments should default to a single primary organization context.

---

## 3. SaaS Tenant Flow

A SaaS customer creates a tenant or workspace.

Expected flow:

1. The customer creates a tenant in managed Isonia SaaS.
2. The tenant receives a default domain, such as `my-org-name.isonia.io`.
3. The tenant may later attach a custom domain.
4. The domain opens App Core in a tenant-specific workspace context.
5. If no organization root exists yet, the user sees the setup wizard.
6. After the organization root is created onchain and indexed by Control Plane, the tenant binds to a primary organization context.
7. Subsequent visits to the tenant domain open the primary organization workspace by default.

The normal SaaS tenant mode should not show a catalog of all organizations across the shared protocol. That catalog may exist for operators, support, development, or advanced administration, but it should not be the default customer UX.

The SaaS tenant record is an application and operations concept. It must not become the source of governance authority. Onchain contracts remain authoritative for the governance state they control.

---

## 4. Self-Hosted Flow

In self-hosted deployments, an operator deploys and configures:

- App Core;
- Control Plane;
- storage or IPFS gateway settings;
- contract addresses;
- chain configuration;
- runtime config.

The default self-hosted UX should also be single-org unless configured otherwise. A DAO, foundation, grants program, or protocol team usually wants its own governance workspace, not an open explorer for unrelated organizations.

Self-hosted operators may enable multi-organization mode for:

- local demos;
- development environments;
- agencies managing several clients;
- infrastructure operators;
- advanced governance administration.

---

## 5. Runtime Modes

### single-org

`single-org` is the primary tenant and customer mode.

Characteristics:

- one tenant or deployment resolves to one primary organization workspace;
- setup wizard appears if the primary organization does not exist yet;
- navigation centers on one organization;
- cross-organization catalog views are hidden or unavailable by default;
- domain binding resolves directly to the workspace context.

### multi-org-admin

`multi-org-admin` is for operators, agencies, support staff, and advanced administrators.

Characteristics:

- multiple organizations may be listed;
- users may switch organization context deliberately;
- operational diagnostics may span organizations;
- access control and visibility rules must be explicit before production use.

This mode is not the normal customer-facing SaaS experience.

### developer-demo

`developer-demo` is for local development and demos.

Characteristics:

- seeded or test organizations may appear together;
- organization switching may be visible;
- mock, local, or deterministic demo data may be used;
- the mode should be clearly separated from production SaaS expectations.

---

## 6. Why Multi-Org Still Exists

Multi-organization support remains useful because IsoniaOS uses a shared protocol model where organizations are isolated by `orgId`.

Multi-org capability helps with:

- local testing of tenant isolation and `orgId` boundaries;
- demos involving several governance examples;
- operator dashboards;
- agency workflows;
- linked deployments or governance roots;
- future public discovery or archive surfaces.

This technical capability should not force every customer into a multi-org product experience.

---

## 7. Single-Org UX Rules

In `single-org` mode:

- the tenant domain should open the primary organization workspace directly;
- if no primary organization exists, show setup;
- App Core should avoid presenting unrelated organizations;
- organization routes should assume the tenant context when possible;
- wallet, chain, indexer, and setup diagnostics should be scoped to the tenant workspace;
- users should not need to understand shared protocol deployment mechanics to use their workspace.

The UI may still expose the underlying organization ID, chain, contract address, and indexing status where those details help verification and diagnostics.

---

## 8. Multi-Chain Organization Contexts

An organization may operate across several blockchains.

This does not automatically mean several unrelated organizations. The product should usually present this as one human-facing organization workspace with multiple chain deployments or execution contexts.

Example:

- a main chain handles global governance decisions;
- a secondary chain executes local or operational actions;
- another chain may be execution-only;
- some chain deployments may mirror or support one primary governance root.

Suggested terminology:

- Tenant;
- Workspace;
- Primary organization;
- Chain deployment;
- Execution context;
- Governance root;
- Linked organization;
- Linked deployment.

Future architecture may need an `organization workspace` or `tenant organization` concept that binds several chain-specific `orgId` values or deployments under one human-facing organization.

The UI should make clear which chain context is active when users inspect proposals, approvals, execution routes, or diagnostics.

---

## 9. When Multi-Org Is Appropriate

Multi-org may be appropriate when the deployments represent materially distinct governance roots.

Examples:

- separate legal entities;
- unrelated DAOs or customer organizations;
- separate governance communities;
- independent mandates and approval routes;
- execution contexts that cannot be safely represented as one primary organization;
- operator or agency administration across several customers;
- local demo scenarios with multiple test organizations.

Multi-chain does not by itself require multi-org UX. A single organization workspace may contain several linked chain deployments when the human-facing organization and governance root are shared or intentionally connected.

---

## 10. Future Milestones

### Tenant Mode & Domain Binding

Define tenant records, default subdomains, custom domain binding, setup-state routing, and primary organization binding.

### Organization Workspace / Chain Deployment Mapping

Define how one human-facing organization workspace maps to one or more chain deployments, contract addresses, and chain-specific organization IDs.

### Multi-Chain Execution Contexts

Define how proposals, approvals, route explanations, and execution status are represented when governance decisions and execution actions span multiple chains.

### Admin/Operator Console

Define a separate operator experience for multi-organization administration, diagnostics, support, and advanced configuration.

---

## 11. Non-Goals

This document does not define or claim:

- production SaaS implementation now;
- billing;
- tenant isolation implementation;
- custom domain verification implementation;
- multi-chain execution implementation now;
- production support or operational guarantees;
- legal, compliance, or audit readiness.
