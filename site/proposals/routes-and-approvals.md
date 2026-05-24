# Routes and Approvals

Routes explain how a proposal moves from submission to decision and, when needed, execution.

## Route contents

A route should define:

- proposal type;
- eligible proposers;
- required reviewers;
- decision body or voting module;
- quorum and threshold rules where applicable;
- veto body where applicable;
- timelock where applicable;
- executor or execution authority;
- evidence requirements after execution.

## Approval sources

Approvals can come from different sources:

- contract-backed approvals;
- token votes;
- role or council approvals;
- external vote records;
- manual annotations.

The UI should label which source supplied the approval record.

## Veto and timelock

Vetoes and timelocks are authority-sensitive. If they are contract-backed, contract state is authoritative. If they are external or manual, they must be labeled as context or annotation.

## Current status

Route modeling is being normalized across contracts, shared types, Control Plane, SDK, and App Core.
