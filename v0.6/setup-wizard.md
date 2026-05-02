# IsoniaOS v0.6 Setup Wizard

## Purpose

Replace the long raw “New Organization” form with a guided setup wizard for Simple DAO+.

The setup wizard should keep the v0.5 setup draft model but make the user experience easier to understand.

## Primary user goal

A user should be able to create a Simple DAO+ organization without understanding every low-level setup action.

## Wizard steps

### Step 1 — Choose template

Initial supported template:
- Simple DAO+

Preview/locked templates:
- Bicameral Council
- Security-Gated Operations

Template cards should explain:
- what the template creates;
- what authority model it uses;
- whether it is ready or planned.

### Step 2 — Organization identity

Fields:
- organization name;
- organization slug if supported;
- metadata URI;
- admin address.

Admin address should use AddressInput.

### Step 3 — Governance bodies

Show the bodies that Simple DAO+ will create:
- General Council;
- Treasury Committee;
- Security Council.

This step can initially be read-only with optional metadata labels.

### Step 4 — Members and holders

Use MultiAddressInput for:
- General Council holders;
- Treasury Committee holders;
- Security Council holders;
- executor holder if separate.

The user should be able to paste multiple Hardhat accounts or wallet addresses.

### Step 5 — Policy routes

Show planned policy routes:
- standard proposals;
- treasury proposals;
- upgrade proposals;
- emergency proposals.

Fields:
- standard timelock;
- treasury timelock;
- upgrade timelock;
- emergency timelock;
- executor body.

This step should explain which body approves, vetoes, and executes each route.

### Step 6 — Review setup draft

Show a human-readable summary:
- organization;
- bodies;
- roles;
- mandates;
- policy routes;
- number of actions;
- warnings;
- errors;
- assumptions.

The setup draft remains editable before transactions are sent.

### Step 7 — Execute setup

Show action-by-action execution progress.

Actions should not be hidden. Users should see the mapping from setup draft to chain transactions.

## Draft model

The wizard should continue to produce a browser-side setup draft.

Authority is created only by explicit contract transactions. The draft itself is not authoritative.

## Validation

Validation should distinguish:
- blocking errors;
- warnings;
- informational assumptions.

Examples:
- invalid address: error;
- zero address holder: error;
- empty holder list: error or warning depending on field;
- duplicate holder: warning or auto-deduplicated info;
- unsupported ENS: warning or error depending on current implementation;
- unresolved dependency between setup actions: error.

## Non-goals

The setup wizard should not implement:
- arbitrary custom governance template builder;
- custom role taxonomy editor;
- arbitrary calldata builder;
- SaaS onboarding;
- organization billing;
- final theme customization.
