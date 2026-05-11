# IsoniaOS v0.6 Design Partner Demo

**Milestone:** v0.6 alpha  
**Audience:** DAO operators, protocol governance teams, grants program managers, and technical design partners  
**Goal:** Demonstrate that IsoniaOS makes the governance lifecycle understandable from proposal to execution.

---

## 1. Demo Thesis

The demo should prove one thing:

```text
IsoniaOS makes governance legible after the vote.
```

The demo should not try to sell every future feature.

Do not position v0.6 as production-ready, SaaS-ready, AI-ready, Safe-integrated, or audit-ready.

---

## 2. Recommended Demo Scenario

### Scenario

A Simple DAO+ organization approves and executes a simple treasury/grant-style proposal.

### Story

A DAO wants to fund an ecosystem contributor. The proposal must follow the organization’s governance route, receive approval, avoid veto, wait through timelock, execute, and leave a public record.

### Why this story works

It is easy to understand:

- someone proposes a decision;
- the DAO reviews/approves;
- veto is possible;
- timelock protects execution;
- execution happens;
- the record remains.

---

## 3. Demo Flow

### Step 1 — Open the local app

Show that this is a local alpha environment.

Say:

```text
This is v0.6 alpha. The goal is demo readiness, not production treasury execution.
```

### Step 2 — Diagnostics

Open `/diagnostics` first or early.

Show:

- API status;
- configured chain;
- latest block;
- contract addresses;
- indexer status;
- projection status;
- connected wallet;
- wallet chain.

Why:

Diagnostics prove that IsoniaOS treats governance infrastructure as a system, not just a UI.

### Step 3 — Create Simple DAO+

Use the setup wizard.

Show:

- organization identity;
- admin address;
- General Council;
- Treasury Committee;
- Security Council;
- executor holder;
- policy routes.

Say:

```text
The user does not need to understand every setup action up front. The wizard explains the governance structure before transactions are sent.
```

### Step 4 — Review setup draft

Show the review screen.

Highlight:

- bodies;
- roles;
- policy routes;
- number of actions;
- warnings/errors/assumptions.

Say:

```text
The draft is not authoritative. Authority is created only by explicit transactions.
```

### Step 5 — Execute setup

Show action-by-action execution progress.

Highlight states:

- pending;
- signing;
- submitted;
- mined;
- indexed;
- projected;
- completed;
- failed where applicable.

Say:

```text
We do not hide the transaction lifecycle. Users can see whether a problem is chain execution, indexing, projection, config, or wallet state.
```

### Step 6 — Create proposal

Create a proposal using the configured demo target action.

Show:

- proposal id;
- organization id;
- proposal type;
- creator;
- target;
- value;
- data hash;
- metadata label.

### Step 7 — Explain route

Show route explanation.

Highlight:

- required approvals;
- veto bodies;
- executor body;
- timelock;
- available actions.

Say:

```text
Governance should be understandable before users click action buttons.
```

### Step 8 — Approve / Veto path

Show approval and, if useful, veto possibility.

If demonstrating veto, explain that veto is a governance route feature and not a generic UI override.

### Step 9 — Queue and timelock

Queue the proposal.

If running on Hardhat chain `31337`, use local time controls.

Say:

```text
Timelock makes execution a visible phase, not a hidden backend step.
```

### Step 10 — Execute

Execute the proposal.

Show:

- transaction hash;
- final proposal state;
- DemoTarget result;
- public record.

### Step 11 — Close with lifecycle

End with:

```text
Most DAO tools show proposal or vote state. IsoniaOS shows the governance lifecycle: route, approval, veto, timelock, execution, and record.
```

---

## 4. Talk Track

### Opening

DAO governance is fragmented. A proposal may start in a forum, pass in Snapshot or onchain governance, execute through a multisig, and then disappear into chat history or spreadsheets.

IsoniaOS is designed to connect that lifecycle.

### During setup

This is not just a DAO launcher. The setup wizard is a way to make governance structure visible: bodies, roles, routes, vetoes, timelocks, and execution authority.

### During proposal route

The route explanation is important because governance decisions should be understandable before they are executed.

### During execution

The execution phase is where many governance systems lose accountability. IsoniaOS makes execution visible and records the outcome.

### Closing

v0.6 is a local alpha demo. The next steps are integration preview and accountability dashboard, so existing DAO tools can be connected into one lifecycle record.

---

## 5. Questions to Ask Design Partners

After the demo, ask:

1. Which part of your current governance process is most fragmented?
2. Where do approved decisions currently get tracked?
3. Who is responsible for execution follow-up?
4. How do community members know execution happened?
5. Which tools must IsoniaOS integrate with first?
6. Would a public accountability dashboard be useful?
7. What fields would every execution record need?
8. Which proposal types are highest pain for you?
9. Where would this fit in your current process?
10. What would prevent your DAO from trying this on a non-critical workflow?

---

## 6. Demo Success Signals

Good signs:

- the partner says “this would replace our spreadsheet/status doc”;
- the partner asks about Snapshot/Safe/Tally/Agora integration;
- the partner asks about grant milestone tracking;
- the partner wants a public archive page;
- the partner can name a real workflow to test;
- the partner understands that IsoniaOS is not another voting app.

Weak signs:

- the partner only asks about token voting;
- the partner thinks it is just a DAO launcher;
- the partner requires production treasury control immediately;
- the partner wants custom enterprise features before using the core flow.

---

## 7. Demo Non-goals

Do not demonstrate or promise:

- production treasury execution;
- audit readiness;
- Safe integration;
- AI assistant;
- delegation;
- token-weighted voting;
- multi-chain indexing;
- SaaS billing;
- civic/state governance.

---

## 8. Demo Checklist

Before demo:

- local chain running;
- backend API running;
- indexer running;
- projections working;
- frontend runtime config correct;
- wallet connected to correct chain;
- test accounts funded;
- contract addresses match backend diagnostics;
- setup wizard works;
- proposal lifecycle works;
- Hardhat time controls available on chainId 31337;
- diagnostics page shows healthy state.

After demo:

- record feedback;
- identify integration priority;
- identify one possible pilot workflow;
- convert feedback into issues;
- update docs if the demo exposed confusion.
