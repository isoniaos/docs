# Troubleshooting

This page explains common user-visible problems in plain language.

## The Organization Is Not Active

Check:

- required roles are set;
- a template is selected;
- proposal route is complete;
- execution and evidence requirements are clear;
- any contract-backed setup required by the current flow is complete.

If the current build does not expose the activation step yet, treat the organization as not fully active for that flow.

## A Proposal Cannot Move Forward

Check:

- the proposal has all required fields;
- reviewers have completed review;
- the configured approver has acted;
- the route is blocked by a missing permission or unmet condition;
- the decision window has not expired.

## Evidence Looks Incomplete

Ask:

- What claim is the evidence supposed to support?
- Is the proof a transaction, external record, document, or manual note?
- Does a reviewer need to confirm it?
- Is the data current, stale, failed, missing, or unknown?

## The Status Looks Wrong

Status can be wrong when:

- a read model is behind the source it represents;
- an external record changed;
- a manual update was entered incorrectly;
- execution happened but evidence was not attached;
- completion was claimed before review.

Do not treat unknown or stale status as success.

## Wallet Or Transaction Problems

For wallet and transaction flows, check:

- connected account;
- connected network;
- configured organization;
- permission for the action;
- transaction details before signing;
- whether the UI says the action is supported in the current build.

## When To Ask A Technical Maintainer

Ask a technical maintainer when:

- the UI shows stale, failed, missing, or unknown data and you cannot resolve it;
- the same transaction appears differently in two places;
- the organization seems active but required actions are disabled;
- a proposal says it executed but no evidence can be found;
- permissions do not match the organization's expected process.
