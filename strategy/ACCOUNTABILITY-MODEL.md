# IsoniaOS Accountability Model

**Status:** Draft  
**Prepared date:** 2026-05-05

---

## 1. Purpose

The accountability model defines how IsoniaOS tracks what happens after a governance decision is approved.

This is the central launch differentiator.

Most DAO tooling can show that a decision passed. IsoniaOS should show:

- who is responsible;
- what must happen;
- when it is due;
- what evidence proves progress;
- whether the decision was executed;
- whether the result matched the approved proposal;
- what the organization learned.

Core statement:

```text
A passed proposal creates an obligation, not just a result.
```

---

## 2. Key Concepts

### Decision

A governance outcome that was approved, rejected, cancelled, expired, or otherwise resolved through the organization’s governance process.

### Obligation

A required follow-up action created by a decision.

Examples:

- execute a transaction;
- pay a grant recipient;
- publish a report;
- ship a protocol change;
- complete a milestone;
- conduct a review;
- update a policy;
- close a working group mandate.

### Responsible Party

The person, role, body, multisig, council, team, delegate, grantee, or contributor responsible for an obligation.

### Due Date

The expected date or time window by which the obligation should be completed.

### Execution Proof

Evidence that a decision was executed.

Examples:

- transaction hash;
- Safe transaction hash;
- block explorer link;
- GitHub merged PR;
- published report;
- EAS attestation;
- uploaded evidence;
- reviewer confirmation;
- external proof URL.

### Milestone

A structured checkpoint for multi-step execution.

Examples:

- grant milestone;
- implementation phase;
- audit completion;
- deployment step;
- public report;
- working group deliverable.

### Deviation

A material difference between what was approved and what happened.

Examples:

- missed deadline;
- changed scope;
- under-delivery;
- cost increase;
- execution failure;
- payload mismatch;
- cancelled work.

### Completion Review

A final review that compares approved intent against delivered outcome.

---

## 3. Accountability Lifecycle

A basic accountability lifecycle should be:

```text
Decision Passed → Obligation Created → Responsible Party Assigned → Deadline Set → Execution Started → Evidence Attached → Completion Reviewed → Archived
```

Failures should be first-class states:

```text
Decision Passed → Obligation Created → Blocked / Delayed / Failed → Reason Published → Review / Escalation → Archived
```

---

## 4. Execution Statuses

Recommended statuses:

### Not Required

The decision does not require execution tracking.

Example: non-binding signal or informational proposal.

### Awaiting Execution

The decision passed but execution has not started.

Required data:

- responsible party;
- expected action;
- due date if known.

### In Progress

Execution has started but is not complete.

Required data:

- status update;
- owner;
- next step.

### Blocked

Execution cannot proceed due to a dependency, dispute, missing approval, technical issue, funding issue, legal issue, or external blocker.

Required data:

- blocker reason;
- owner;
- next review date.

### Executed

The primary approved action has been executed.

Required data:

- execution proof;
- transaction or evidence link where applicable.

### Completed

Execution and review are complete.

Required data:

- completion note;
- reviewer or confirming party;
- evidence link.

### Failed

The obligation failed.

Required data:

- failure reason;
- impact;
- proposed remediation or archive decision.

### Cancelled

The obligation was intentionally cancelled.

Required data:

- cancellation reason;
- authority or process that cancelled it.

---

## 5. Accountability Levels

Use levels so early product versions can support accountability without pretending full automation.

### L0 — Manual Status

A user manually updates status.

Use when:

- no integration exists;
- alpha/demo workflow;
- low-risk record keeping.

### L1 — Linked Proof

A user attaches an external proof link.

Examples:

- Safe transaction URL;
- block explorer transaction;
- GitHub PR;
- published report.

### L2 — Imported Proof

IsoniaOS imports selected metadata from the proof source.

Examples:

- transaction hash;
- mined/executed status;
- PR merged status;
- external proposal result.

### L3 — Verified Proof

IsoniaOS verifies that the proof matches expected proposal data.

Examples:

- transaction target matches approved target;
- payload hash matches reviewed payload;
- attestation schema matches expected milestone;
- Governor proposal ID matches linked route.

### L4 — Native / Executable Accountability

IsoniaOS directly participates in execution or proof creation.

Examples:

- native onchain execution;
- Safe transaction preparation;
- EAS attestation creation;
- contract-enforced milestone release.

L4 is high-risk and should come after security review.

---

## 6. Proposal Accountability Fields

Suggested fields for proposals that require execution:

- `requiresExecution`
- `executionStatus`
- `responsibleParty`
- `responsiblePartyType`
- `dueAt`
- `executionStartedAt`
- `executedAt`
- `completedAt`
- `executionProofs[]`
- `milestones[]`
- `failureReason`
- `cancellationReason`
- `completionReview`
- `lastStatusUpdateAt`
- `statusUpdatedBy`

---

## 7. Milestone Fields

Suggested fields:

- `id`
- `proposalId`
- `title`
- `description`
- `responsibleParty`
- `dueAt`
- `status`
- `evidence[]`
- `reviewer`
- `reviewStatus`
- `completedAt`
- `failureReason`

Recommended statuses:

```text
Not Started → In Progress → Evidence Submitted → Accepted / Rejected → Completed / Failed / Cancelled
```

---

## 8. Grant DAO Example

### Scenario

A grants DAO approves funding for an ecosystem project.

### Lifecycle

1. Applicant submits grant proposal.
2. Reviewers evaluate proposal.
3. DAO approves funding.
4. IsoniaOS creates obligations:
   - execute payment;
   - track milestone 1;
   - track milestone 2;
   - publish final report.
5. Safe transaction is linked as funding proof.
6. Grantee submits milestone evidence.
7. Reviewer accepts or rejects milestone.
8. Final completion review is archived.

### Public value

Community members can see:

- what was funded;
- how much was paid;
- who is responsible;
- what milestones were promised;
- what evidence was submitted;
- whether the grant delivered.

---

## 9. Protocol Governance Example

### Scenario

A protocol DAO approves a parameter change.

### Lifecycle

1. Proposal is drafted.
2. Technical review is linked.
3. Payload source is linked.
4. Vote passes.
5. Timelock starts.
6. Transaction executes.
7. Execution proof is attached.
8. Post-execution note confirms final state.
9. Governance memory records precedent.

### Public value

Participants can see:

- what parameter changed;
- who reviewed it;
- whether payload matched intent;
- when execution happened;
- what transaction proves it;
- whether there were issues.

---

## 10. Working Group Example

### Scenario

A DAO approves a working group mandate and budget.

### Lifecycle

1. Mandate proposal passes.
2. IsoniaOS creates obligations:
   - publish monthly report;
   - deliver roadmap item;
   - spend within approved budget;
   - submit end-of-term review.
3. Working group posts status updates.
4. Community reviews progress.
5. Completion review compares approved mandate vs delivered work.

### Public value

The DAO can evaluate whether the working group delivered against its mandate.

---

## 11. Failure and Deviation Reporting

Failures should not be hidden.

A failure report should include:

- what was approved;
- what failed;
- why it failed;
- who was responsible;
- what was already executed;
- what funds or assets were affected;
- what remediation is proposed;
- whether a dispute or review is needed.

A deviation report should include:

- original approved scope;
- actual delivered scope;
- difference;
- reason;
- approval required if scope changed materially.

---

## 12. Accountability Metrics

IsoniaOS should eventually calculate:

- proposal execution rate;
- average time to execution;
- average execution delay;
- percentage of proposals with responsible party;
- percentage of proposals with due date;
- percentage of executed proposals with proof;
- percentage of grant milestones completed;
- unresolved obligations;
- failed/cancelled obligations;
- repeat delayed responsible parties;
- governance health score indicators.

---

## 13. UX Requirements

The accountability UX should answer five questions quickly:

1. What was approved?
2. Who owns it?
3. What is the current status?
4. What proof exists?
5. What remains unresolved?

Proposal pages should make execution status visible above the fold once a proposal passes.

Public archives should allow filtering by:

- awaiting execution;
- in progress;
- blocked;
- completed;
- failed;
- responsible party;
- proposal type;
- due date.

---

## 14. Anti-Patterns

Avoid:

- treating a passed vote as complete governance;
- hiding failed execution;
- making completion status editable without history;
- presenting unverified external links as verified proof;
- requiring production integrations before manual accountability records exist;
- over-automating high-risk execution early;
- letting AI mark obligations complete without human/community confirmation.

---

## 15. v0.8 Minimum Viable Accountability

The first strong accountability release should include:

- execution required flag;
- responsible party;
- due date;
- execution status;
- status history;
- external proof links;
- transaction hash field;
- completion note;
- failure/cancellation reason;
- public archive view.

This is enough to show the core product value before advanced disputes, attestations, or AI are added.
