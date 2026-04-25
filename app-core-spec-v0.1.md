# IsoniaOS v0.1 — App Core Spec

Status: Draft for implementation  
Scope: Public self-hostable React app core, theme integration, SaaS-ready extension points  
Product: IsoniaOS  
Company: Isonia

---

## 1. Purpose

`isonia-app-core` is the public frontend application core for IsoniaOS.

It must provide the base governance console that works for:

- self-hosted installations;
- free/public hosted usage;
- SaaS mode through private extensions;
- custom themes through a formal theme contract.

The app core must not contain SaaS-only billing/subscription logic and must not hardcode the Isonia commercial UI as an inseparable dependency.

---

## 2. Non-goals for v0.1

Do not implement in v0.1:

- marketing website for `isonia.org`;
- billing/subscription pages;
- enterprise admin;
- theme marketplace;
- visual theme builder;
- advanced analytics;
- AI copilot;
- full mobile optimization beyond responsive basics;
- GraphQL client;
- complex role management UI beyond prototype flows.

---

## 3. Core principles

### 3.1 One app core, multiple modes

Self-hosted and SaaS must not become separate duplicated products.

The app core must support mode-specific features through configuration and extension points.

### 3.2 Theme is replaceable

The default theme must be a separate package/repo and must be replaceable by a custom theme package.

### 3.3 Backend is query layer, chain is authority layer

The app should read indexed data from REST API and use wallet interactions only for transactions/direct verification.

The app must not perform expensive chain reads for every screen.

### 3.4 Minimal dependencies

Use only necessary dependencies.

Required/expected:

- React;
- wagmi;
- viem;
- routing/build framework selected by team;
- minimal UI utilities if needed.

Avoid:

- large UI frameworks unless explicitly approved;
- unnecessary state-management libraries;
- npm packages that own critical business logic.

---

## 4. App architecture

Recommended logical packages/modules:

```text
src/
  app/                 # app bootstrap, routes, providers
  config/              # runtime config, feature flags
  domain/              # domain types, mappers, route models
  api/                 # REST API client
  chain/               # wagmi/viem interactions
  features/            # feature modules
  ui/                  # local UI composition if not separate package
  theme/               # theme loader/adapter
  layouts/             # layout primitives
```

If using a monorepo/workspace later, preferred logical packages:

```text
packages/theme-types
packages/ui-core
packages/ui-governance
packages/app-sdk
apps/app-core
```

v0.1 can keep this simpler, but boundaries should remain clear.

---

## 5. Runtime modes

### 5.1 Supported modes

```ts
export type RuntimeMode = 'self-hosted' | 'hosted-free' | 'saas';
```

### 5.2 Runtime config

```ts
export interface RuntimeConfig {
  appName: string;
  mode: RuntimeMode;
  apiBaseUrl: string;
  chainId: number;
  contracts: {
    govCore: `0x${string}`;
    govProposals: `0x${string}`;
    demoTarget?: `0x${string}`;
  };
  features: {
    createProposal: boolean;
    manageOrg: boolean;
    advancedAnalytics: boolean;
    billing: boolean;
    customTheme: boolean;
    saasAdmin: boolean;
  };
  theme: {
    source: 'default' | 'package' | 'runtime';
    packageName?: string;
  };
}
```

### 5.3 Config rules

- App core must work with only default config and default theme.
- SaaS-only features must be disabled unless provided by private SaaS extension.
- Self-hosted mode must not call SaaS-only endpoints.

---

## 6. Theme architecture

### 6.1 Theme module contract

A theme module must export:

```ts
export interface IsoniaThemeModule {
  id: string;
  name: string;
  tokens: ThemeTokens;
  brand: ThemeBrand;
  components?: ThemeComponentVariants;
  layout?: ThemeLayoutConfig;
}
```

### 6.2 Theme tokens

```ts
export interface ThemeTokens {
  colors: {
    background: string;
    foreground: string;
    muted: string;
    border: string;
    primary: string;
    primaryForeground: string;
    danger: string;
    warning: string;
    success: string;
  };
  radius: {
    sm: string;
    md: string;
    lg: string;
    xl: string;
  };
  spacing: {
    xs: string;
    sm: string;
    md: string;
    lg: string;
    xl: string;
  };
  typography: {
    fontFamily: string;
    headingFontFamily?: string;
  };
}
```

### 6.3 Theme brand

```ts
export interface ThemeBrand {
  productName: string;
  companyName?: string;
  logo?: string;
  mark?: string;
  favicon?: string;
}
```

### 6.4 v0.1 theme requirements

- `isonia-theme-default` must satisfy `IsoniaThemeModule`.
- App core must not hardcode Isonia colors directly into domain components.
- Custom theme support may be build-time/package-based in v0.1.
- Runtime remote themes are not required in v0.1.

---

## 7. REST API client

The app must consume the v0.1 REST API.

### 7.1 Required API methods

```ts
getOrganizations()
getOrganization(orgId)
getOrganizationOverview(orgId)
getBodies(orgId)
getRoles(orgId)
getMandates(orgId)
getHolderMandates(orgId, address)
getProposals(orgId)
getProposal(orgId, proposalId)
getProposalRoute(orgId, proposalId)
getGovernanceGraph(orgId)
getHealth()
getVersion()
```

### 7.2 API rules

- API client must treat big integer IDs as strings in UI models.
- API errors must be normalized.
- Loading/error/empty states are required for all primary screens.

---

## 8. Wallet and chain interactions

Use wagmi + viem.

### 8.1 Required transaction flows

- connect wallet;
- create proposal;
- approve proposal;
- veto proposal;
- queue proposal;
- execute proposal.

### 8.2 Rules

- Transaction buttons must be disabled if route/API says action is unavailable.
- UI should still expect contract revert and display normalized errors.
- Do not trust only frontend access checks; contracts remain authority.

---

## 9. Required screens

### 9.1 Organizations screen

Route example:

```text
/orgs
```

Shows:

- organizations list;
- org status;
- body count;
- active proposals count if available.

### 9.2 Organization overview

Route:

```text
/orgs/:orgId
```

Shows:

- organization metadata;
- bodies summary;
- active mandates summary;
- proposals summary;
- quick links to governance map and proposals.

### 9.3 Governance map

Route:

```text
/orgs/:orgId/graph
```

Shows graph of:

- organization;
- bodies;
- roles;
- holders;
- proposal types;
- approval/veto/execution relationships.

v0.1 can implement a simple static graph/list visualization first. Fancy canvas graph is optional.

### 9.4 Bodies and roles

Route:

```text
/orgs/:orgId/bodies
```

Shows:

- bodies;
- roles per body;
- role type;
- active/inactive state.

### 9.5 Mandates

Route:

```text
/orgs/:orgId/mandates
```

Shows:

- mandate holder;
- role;
- body;
- proposal type scope;
- start/end time;
- active/revoked state.

### 9.6 Proposals list

Route:

```text
/orgs/:orgId/proposals
```

Shows:

- proposal id;
- type;
- status;
- creator;
- created time;
- route summary;
- data status observed/confirmed.

### 9.7 Proposal details

Route:

```text
/orgs/:orgId/proposals/:proposalId
```

Shows:

- metadata;
- status;
- target;
- data hash;
- route explanation;
- required approvals;
- veto bodies;
- timelock;
- blockers;
- action buttons where applicable.

### 9.8 Create proposal

Route:

```text
/orgs/:orgId/proposals/new
```

For v0.1:

- proposal type;
- metadata URI or simple metadata form;
- target;
- action data hash or demo action;
- submit transaction.

---

## 10. Route explanation UI

Proposal details must clearly show:

- who must approve;
- who has already approved;
- who can veto;
- whether veto happened;
- whether timelock is required;
- when execution becomes available;
- why execution is currently blocked.

Example blockers:

```text
Missing approval from General Council
Timelock not expired
Proposal was vetoed by Security Council
Wallet does not have Executor mandate
```

---

## 11. Data status UI

Because blockchain data can be observed before confirmed, UI should support:

- `Observed` badge;
- `Confirmed` badge;
- optionally tooltip explaining finality status.

---

## 12. SaaS extension boundaries

The public app core must not include SaaS-only implementation, but it must expose extension points.

### 12.1 Extension areas

- top navigation extra items;
- organization sidebar extra items;
- dashboard widgets;
- advanced analytics panels;
- billing/subscription route injection;
- SaaS admin route injection.

### 12.2 Rule

Private `isonia-saas` should extend app core, not fork or duplicate it.

---

## 13. Self-hosted requirements

v0.1 self-host mode must support:

- custom API base URL;
- custom chain ID;
- custom contract addresses;
- default or custom theme package;
- disabling SaaS-only screens.

Self-host mode does not require full Docker packaging in app-core spec, but config must make it possible.

---

## 14. Error handling

All screens must handle:

- API unavailable;
- empty lists;
- unsupported chain;
- wallet not connected;
- wallet connected to wrong chain;
- transaction rejected;
- contract revert;
- proposal not found;
- organization not found.

---

## 15. Minimal dependency policy

Allowed:

- React;
- wagmi;
- viem;
- Next.js or selected React framework if team chooses;
- small utility packages after review;
- dev-only libraries.

Avoid:

- heavy state management unless justified;
- no-name UI component libraries;
- packages that perform hidden wallet/transaction logic;
- packages that own governance domain logic.

All critical domain mappers and route display logic should be first-party code.

---

## 16. Suggested file structure

```text
src/
  app/
    routes/
    providers/
  api/
    client.ts
    types.ts
    errors.ts
  chain/
    contracts.ts
    actions.ts
    wagmi.ts
  config/
    runtime-config.ts
    features.ts
  domain/
    organizations.ts
    bodies.ts
    roles.ts
    mandates.ts
    proposals.ts
    route-explanation.ts
    graph.ts
  features/
    organizations/
    governance-map/
    proposals/
    mandates/
  theme/
    theme-provider.tsx
    default-theme-adapter.ts
  ui/
    primitives/
    layout/
    status/
```

---

## 17. Acceptance criteria

App core v0.1 is complete when:

- it can connect to configured REST API;
- it shows organizations;
- it shows organization overview;
- it shows bodies, roles, and mandates;
- it shows proposals;
- it shows proposal route explanation;
- it shows governance graph;
- wallet can submit create/approve/veto/queue/execute transactions against v0.1 contracts;
- default theme is externalized through theme contract;
- runtime config supports self-hosted and hosted modes;
- SaaS-only features are not hardcoded into public app core;
- all primary screens have loading/error/empty states.
