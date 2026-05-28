# IsoniaOS Whitepaper

## 1. Abstract

IsoniaOS is a governance control plane and self-management operating layer for accountable digital organizations.

It starts from a practical problem: communities often know that a proposal passed, but they cannot easily show what was reviewed, who became responsible, what action followed, what evidence proves the outcome, and what future participants should remember.

IsoniaOS treats governance as a lifecycle:

```text
Tension -> Framing -> Proposal or Advice Process -> Decision -> Execution -> Evidence -> Accountability -> Memory
```

The first public focus is DAO governance because the pain is concrete. DAOs manage proposals, roles, approvals, shared budgets, contributor work, grants, external records, onchain actions, and community discussion across many tools. IsoniaOS does not try to replace every tool. It helps the organization connect the records, keep authority boundaries clear, and make distributed work accountable.

The long-term direction is broader than voting. IsoniaOS aims to help DAOs, foundations, cooperatives, public-good communities, open-source projects, protocol teams, civic groups, and other digital organizations move toward accountable self-management: roles instead of hidden hierarchy, policies instead of opaque authority, evidence instead of trust-me claims, and AI-assisted coordination without centralized control.

## 2. The Problem: Governance Decisions Become Fragmented Records

Modern digital organizations use many places to make and record decisions:

- forum posts and documents for context;
- Telegram, Discord, Slack, and community chat for discussion;
- calls, meeting notes, and community updates for informal alignment;
- Snapshot, Tally, Agora, Aragon, DAOHaus, Colony, XDAO, or other governance tools for proposals, voting, delegation, work, or community operations;
- Safe and other wallet systems for execution;
- block explorers and external links for proof;
- spreadsheets, issue trackers, or project boards for follow-up.

Each place can be useful. The problem is that the full story becomes hard to reconstruct.

A community member may see that a proposal was approved and still not know:

- what problem or tension the proposal tried to resolve;
- which discussion shaped the decision;
- which review process applied;
- who had permission to approve, veto, advise, or execute;
- which people or roles were affected;
- what action was expected after approval;
- who became responsible for follow-through;
- whether the action happened;
- what evidence supports the outcome;
- whether the work is blocked, late, failed, or complete;
- where future contributors should look for the decision history.

This creates an execution gap. The organization makes a decision, but the follow-through becomes private, scattered, or unclear.

It also creates a self-management gap. People may be told that the organization is decentralized or community-led, but the actual authority can remain hidden in private chats, multisigs, informal founder decisions, contributor cliques, or untracked operational habits. IsoniaOS is designed to make those authority paths visible without pretending that one interface is the whole source of truth.

## 3. Why This Matters For Digital Organizations

Governance is not only the moment of voting or approval. Good governance needs context before a decision, clear authority during the decision, and visible accountability after the decision.

Without that lifecycle:

- contributors repeat old debates because the record is hard to find;
- admins must answer the same status questions again and again;
- approved work can drift away from what was actually authorized;
- grants and contributor scopes can lose clear ownership;
- reviewers cannot tell whether a proposal was executed as intended;
- delegated power can be exercised without enough visibility;
- decisions can be forced into votes even when a role decision or advice process would be healthier;
- informal leadership can become more powerful than the documented governance model;
- new participants struggle to understand how the organization really works.

IsoniaOS is designed to make governance records easier to follow, but the deeper purpose is to help organizations operate without depending on opaque hierarchy.

A self-managed organization does not mean an organization without power. It means power is distributed through visible roles, policies, decision modes, evidence, accountability, and review.

## 4. IsoniaOS Vision

The vision is accountable self-management for digital organizations.

IsoniaOS should help a DAO, grants program, council, foundation, public-good community, cooperative, association, open-source project, protocol team, or working group answer eight questions quickly:

1. What tension, need, or opportunity started this work?
2. What was decided?
3. Who had authority?
4. Which role, circle, policy, or vote created that authority?
5. What action was expected?
6. What evidence exists?
7. Who is accountable now?
8. What remains unresolved?

The product direction is summarized by three statements:

```text
Governance is not a vote. Governance is a lifecycle.
```

```text
From proposal to proof of execution.
```

```text
From hierarchy and hidden coordination to accountable self-management.
```

IsoniaOS should become the memory, accountability, and coordination layer for organizations that want to distribute authority without losing responsibility.

## 5. Accountable Self-Management And Teal Governance

The term “teal governance” is used here as a practical shorthand for mature self-management. In this context, it does not mean vague horizontality or the absence of leadership. It means an organization where:

- authority is distributed through roles, circles, policies, and explicit decision modes;
- people can act without asking a central manager for every decision;
- important decisions are still traceable, reviewable, and accountable;
- the organization is guided by a clear purpose, not only by short-term voting outcomes;
- governance evolves through tensions, feedback, and evidence;
- AI can assist coordination, but it does not become the source of authority.

IsoniaOS can express teal governance in a public, technical, and auditable way.

Instead of reducing governance to this loop:

```text
Proposal -> Vote -> Result
```

IsoniaOS should support a richer loop:

```text
Purpose -> Tension -> Framing -> Advice or Proposal -> Decision -> Execution -> Evidence -> Accountability -> Learning -> Updated Purpose, Role, Policy, or Template
```

This model matters because many DAO systems solve the voting problem but not the organization problem. Real organizations need roles, budgets, working groups, operational policies, conflict handling, execution tracking, and memory.

IsoniaOS should not present self-management as an unverified maturity claim. It should show which parts are modeled, which parts are manual, which parts come from external systems, and which parts are planned.

## 6. Core Product Model

IsoniaOS organizes governance and self-management around durable objects:

| Object | Plain-language meaning |
| --- | --- |
| Organization | The DAO, working group, grants program, council, cooperative, protocol team, or community using IsoniaOS. |
| Purpose | The organization’s reason for existing, operating principles, and high-level direction. |
| Circle | A semi-autonomous working group around a purpose, domain, budget, or function. |
| Role | A named responsibility, such as admin, reviewer, executor, treasury steward, grant reviewer, security reviewer, contributor, delegate, or observer. |
| Permission | A rule for who can do something. |
| Policy | A documented rule that defines authority, process, limits, thresholds, or review requirements. |
| Template | A reusable setup pattern for common governance and self-management processes. |
| Tension | A visible gap between the current state and a better state: problem, risk, need, opportunity, ambiguity, or conflict. |
| Proposal | A request for the organization to decide something. |
| Advice process | A decision mode where a role-holder can decide after consulting affected people and relevant experts. |
| Consent process | A decision mode where a change can proceed unless there is a reasoned objection. |
| Decision | The outcome of a proposal, role authority, advice process, consent process, or vote. |
| Execution | The action expected after a decision. |
| Evidence | A record that supports a claim about what happened. |
| Accountability record | The follow-up record showing owner, status, due date, evidence, and review outcome. |
| Discussion source | A Telegram, Discord, Slack, forum, call note, or other external context source imported or linked with clear boundaries. |
| Integration adapter | A connector to an external governance, execution, discussion, proof, or work system. |
| Governance memory | The durable history that future participants can inspect. |

The product model is not only about creating records. It is about showing relationships between records.

```mermaid
flowchart TD
  Org["Organization"] --> Purpose["Purpose and principles"]
  Org --> Circles["Circles"]
  Org --> Roles["Roles and permissions"]
  Org --> Policies["Policies"]
  Org --> Templates["Templates"]
  Purpose --> Tension["Tension"]
  Circles --> Tension
  Roles --> Tension
  Tension --> Framing["Framing and affected parties"]
  Framing --> Advice["Advice process"]
  Framing --> Proposal["Proposal"]
  Framing --> Consent["Consent process"]
  Policies --> Advice
  Policies --> Proposal
  Policies --> Consent
  Templates --> Proposal
  Roles --> Decision["Decision"]
  Advice --> Decision
  Proposal --> Decision
  Consent --> Decision
  Decision --> Execution["Execution"]
  Execution --> Evidence["Evidence"]
  Evidence --> Accountability["Accountability record"]
  Accountability --> Memory["Governance memory"]
  Memory --> Purpose
```

## 7. Organization Lifecycle

An organization should move through a simple lifecycle.

| Stage | What it means |
| --- | --- |
| Create | A new organization record is started with a name, purpose, and admin context. |
| Configure | The organization chooses roles, permissions, circles, policies, decision modes, and templates. |
| Activate | Required settings are complete enough for the configured governance process to be used. |
| Operate | Participants raise tensions, create proposals, run advice or consent processes, review decisions, execute approved work, and attach evidence. |
| Review | The organization checks follow-through, delays, failures, completion notes, unresolved tensions, and policy gaps. |
| Learn | Resolved work produces lessons that can update roles, policies, templates, circles, or purpose statements. |
| Remember | Resolved decisions become part of the governance memory. |

Activation matters because a half-configured organization can be misleading. IsoniaOS should make it clear whether the organization is still being set up, active for the configured flow, paused, limited by missing data, or relying on external/manual records.

In contract-backed flows, activation and authority should be tied to modeled contract state. In manual or external-record flows, IsoniaOS should show that those records are annotations or evidence unless a documented model says otherwise.

## 8. Roles, Circles, And Permissions

Roles help people understand responsibility. Permissions define what those roles can do. Circles group related roles, policies, budgets, and tensions around a domain of work.

An early organization may use simple roles:

- Admin: configures the organization and core settings.
- Reviewer: checks proposals before a decision.
- Approver: can approve a proposal under the configured route.
- Executor: can perform or confirm an approved action.
- Treasury Steward: prepares and executes treasury work within defined limits.
- Security Reviewer: reviews high-risk technical or contract-sensitive actions.
- Circle Facilitator: helps a working group process tensions and decisions.
- Contributor: submits proposals, raises tensions, or completes assigned work.
- Observer: can read public records without changing them.

A mature role should answer:

- What is the purpose of this role?
- What accountabilities belong to it?
- What authority does it have?
- What authority does it not have?
- Which policies constrain it?
- Which circle or organization does it serve?
- Who currently holds it?
- When should the role be reviewed?

A permission should answer a narrow question:

- Who can create a proposal?
- Who can raise or classify a tension?
- Who can initiate an advice process?
- Who must be consulted?
- Who can review a proposal?
- Who can approve, reject, veto, or object?
- Who can execute the approved action?
- Who can attach evidence?
- Who can mark follow-up complete?
- Who can update a policy, role, or template?

Good role design should avoid hidden power. A participant should be able to see why a person, circle, wallet, group, delegate, or process can perform an action.

## 9. Tensions As The Starting Point For Work

A tension is a visible gap between the current state and a better state. It can be a problem, risk, opportunity, ambiguity, conflict, missing policy, operational need, or strategic question.

Examples:

- “The treasury policy does not say who can approve payments under 500 USDC.”
- “A security-sensitive upgrade is being discussed in chat, but there is no review record.”
- “A grant was approved, but the deliverable evidence is unclear.”
- “A contributor role has authority in practice, but it is not documented.”
- “A community discussion is active in Discord, but it has not been linked to any decision record.”

Treating tensions as first-class records prevents governance from starting too late. A proposal is already a proposed solution. A tension captures the reason for change before the organization jumps to a vote.

A useful tension record should show:

- source and creator;
- affected circle, role, policy, or proposal;
- affected people or stakeholder groups where appropriate;
- urgency and risk;
- current status;
- related discussion sources;
- whether it became a proposal, advice-process decision, policy update, role update, dispute, task, or archived note.

## 10. Decision Modes: Not Every Decision Should Be A Vote

Voting is important, but it is not the only governance mechanism.

IsoniaOS should support multiple decision modes and make the selected mode visible:

| Decision mode | When it fits |
| --- | --- |
| Role decision | A documented role has clear authority to act. |
| Advice process | A role-holder can decide after consulting affected people and relevant experts. |
| Consent process | A change can proceed unless there is a reasoned objection. |
| Circle decision | A defined circle decides within its domain and policy limits. |
| Token vote | A token-governed process is the intended source of authority. |
| Delegated vote | Delegates vote under a transparent delegation model. |
| Multisig execution | A wallet threshold performs an execution step. |
| Emergency action | A narrow emergency route acts first and creates post-action accountability. |
| Manual record | The organization records an external or offline decision without claiming contract authority. |

The decision record should show why that mode was used.

For example:

- A copy edit may be a role decision.
- A small operating expense may use an advice process.
- A working group policy update may use consent inside a circle.
- A treasury transfer above a threshold may require Safe execution plus community governance evidence.
- A constitutional change may require a wider vote.
- A security emergency may use a narrow emergency route with mandatory post-factum evidence and review.

This is central to accountable self-management. The organization should not be blocked by unnecessary votes, but it should also not allow undocumented authority to replace governance.

## 11. Templates And Repeatable Governance Patterns

Templates help organizations avoid starting from a blank page.

A template can define:

- default purpose prompts;
- default circles;
- default roles;
- review steps;
- decision modes;
- advice-process requirements;
- consent-process requirements;
- required fields for tensions and proposals;
- approval route;
- evidence requirements;
- accountability fields;
- budget and spending rules;
- common statuses;
- archive structure.

For example, a Community Grants DAO might choose a grants template:

1. Contributor raises a funding tension or submits a funding proposal.
2. Reviewers check scope, budget, risks, and expected evidence.
3. A decision mode is selected by policy.
4. Approvers, delegates, or token voters decide under the configured route.
5. A responsible person or circle is assigned.
6. Execution happens through the configured wallet or external system.
7. Evidence is attached when the work is completed.
8. The final record shows outcome, proof, unresolved issues, and lessons learned.

A self-managed startup or open-source project might use a different template:

1. A contributor raises a tension.
2. The affected circle frames the problem.
3. A role-holder runs advice process with affected people and experts.
4. The decision is recorded with rationale.
5. Execution and evidence are tracked.
6. If the decision reveals a structural problem, the circle updates a role, policy, or template.

Templates should be editable over time. A template is a starting pattern, not a guarantee that every organization has the same process.

## 12. Proposals, Decisions, Execution, Evidence, Verification, And Memory

The core IsoniaOS loop connects a decision to follow-through.

```mermaid
sequenceDiagram
  participant Contributor
  participant Circle
  participant Reviewer
  participant Organization
  participant Executor
  participant Record

  Contributor->>Circle: Raise tension or submit proposal
  Circle->>Organization: Frame affected roles, risks, and decision mode
  Reviewer->>Organization: Review context and evidence requirements
  Organization->>Organization: Decide under configured route
  Organization->>Executor: Assign expected action
  Executor->>Record: Attach transaction or external proof
  Record->>Organization: Show verification status
  Organization->>Record: Close, block, learn, or continue follow-up
```

Evidence can come from different places. It may be a transaction, an external public record, a document, a milestone note, a discussion summary, a Safe transaction, a Snapshot vote, a Tally proposal, an Agora delegate record, an Aragon or DAOHaus organization action, a Colony work record, an XDAO governance record, or a manual completion update.

Verification asks a more precise question: what claim does this evidence support?

| Claim | Better evidence |
| --- | --- |
| A contract-backed action executed | Contract event and transaction receipt. |
| A payment or call happened | Chain transaction and visible recipient/action details. |
| A Safe action executed | Safe transaction, threshold context, signer set, and execution transaction. |
| A community vote happened | Proposal record, voting result, source link, and freshness status. |
| A contributor completed work | Linked deliverable plus reviewer confirmation. |
| A discussion influenced a decision | Source-disclosed thread, summary, timestamp range, and affected decision link. |
| A decision is still unresolved | Accountability status, due date, and current note. |
| A public record was imported | External URL, source name, import time, and freshness status. |

Governance memory is the result. It is the durable record that helps future participants understand why a decision happened and whether follow-through matched the approved intent.

## 13. Accountability Model

An approved proposal creates a follow-up question, not only a result.

A self-managed role decision also creates a follow-up question. Distributed authority only works when responsibility remains visible.

IsoniaOS accountability records should help users see:

- responsible person, role, circle, wallet, or group;
- due date or expected window;
- current status;
- source and authority mode;
- affected policy or template;
- evidence links;
- milestone notes;
- failure, cancellation, objection, or escalation reason;
- reviewer or confirming party;
- completion note;
- history of updates.

Useful statuses include:

- not needed;
- waiting for framing;
- waiting for advice;
- waiting for review;
- waiting for execution;
- in progress;
- blocked;
- objected;
- escalated;
- executed;
- complete;
- failed;
- cancelled;
- unknown.

Manual updates are useful, but they should be shown as manual updates. A completion note does not automatically prove that the approved intent was satisfied. The product should preserve the difference between “someone said it is done” and “the evidence supports the claim.”

## 14. Discussion Sources, AI Facilitation, And Organizational Memory

A large part of governance happens before a proposal is formalized. For many organizations, the real context lives in Telegram channels, Discord servers, forums, Slack workspaces, GitHub discussions, issue trackers, meeting notes, calls, newsletters, or community updates.

IsoniaOS should treat these sources as context and evidence, not as automatic authority.

Discussion-source records should disclose:

- source platform;
- source URL or import reference where available;
- organization or channel scope;
- timestamp range;
- freshness status;
- import method;
- summarization method if AI was used;
- whether private or restricted content was excluded, redacted, or permissioned;
- related tension, role, policy, proposal, decision, or accountability record.

AI can help make this usable. It can summarize long threads, identify open questions, extract candidate tensions, detect affected roles, propose decision-mode options, highlight missing evidence, find unresolved accountability items, and compare a decision against purpose or policy.

AI should not be treated as a governor.

IsoniaOS should preserve this boundary:

```text
AI as facilitator, not ruler.
AI as memory assistant, not source of authority.
AI as context engine, not final judge.
```

If AI produces a summary, the record should make that visible. The product should allow humans to inspect the underlying source where permitted and should not hide uncertainty, missing context, or stale imports.

## 15. Integrations And Adapter Philosophy

IsoniaOS should integrate with existing governance and DAO tools instead of pretending they do not exist.

The adapter philosophy is:

```text
Connect external records. Preserve their boundaries. Do not fake authority.
```

Potential integration surfaces include:

- Safe for multisig execution and treasury actions;
- Snapshot for offchain signaling and community votes;
- Tally for Governor-style proposals, voting, and delegation records;
- Agora for delegation and governance participation records;
- Aragon for DAO organization and governance records;
- DAOHaus for Moloch-style DAO records and operations;
- Colony for contributor work, domains, payments, and reputation-like work records;
- XDAO for DAO administration and governance records;
- Telegram, Discord, forums, Slack, and similar platforms for discussion context;
- block explorers and RPC/indexing services for transaction and event evidence.

Each integration should have a maturity label and evidence gate.

An adapter can be:

- planned;
- experimental;
- lab-only;
- read-only preview;
- evidence-linked;
- authority-aware;
- production-supported.

Public docs should not claim provider-completeness until a scoped evidence gate supports that claim.

## 16. Trust And Authority Boundaries

IsoniaOS should make trust boundaries visible.

Contracts can be authoritative for the onchain state they model. Control Plane read models can make that state easier to read, but read models can lag or fail. App Core can present state and start configured wallet interactions, but the interface itself is not the final authority. External records can provide evidence or context, but they do not override contract-backed state unless a specific product model says so.

| Source | What it can do | Boundary |
| --- | --- | --- |
| Contract-backed state | Prove modeled onchain facts. | Only covers the facts the contracts model. |
| Control Plane | Index, project, diagnose, and expose read APIs. | Can be stale, missing, or failed. |
| App Core | Help users view state and initiate configured actions. | Should not hide authority or freshness limits. |
| Safe or wallet record | Show execution context and transaction history. | Does not by itself prove the decision was legitimate unless linked to the governing process. |
| Voting/governance tool record | Show a decision or signal from that tool. | Must preserve that tool’s voting model, source, and limits. |
| Discussion source | Provide context, sentiment, arguments, or affected-party input. | Does not become authority by default. |
| AI summary | Explain, compress, classify, or route information. | Is generated interpretation, not authority or proof. |
| External record | Provide evidence or context. | Does not override IsoniaOS authority by default. |
| Manual note | Explain status, reasons, or follow-up. | Is an annotation unless verified another way. |

Clear wording matters. A good public record should say things like:

```text
This record is linked evidence. It does not override contract state.
```

```text
This discussion summary was AI-assisted and should be reviewed against the source before it is used for a high-impact decision.
```

## 17. User Experience Model

The user experience should be organized around questions people actually ask.

For a community member:

- What is this organization?
- What is its purpose?
- Which proposals, tensions, and decisions are active?
- What was approved?
- What happened after approval?
- What evidence can I inspect?
- Who owns the next step?
- Which discussions shaped this decision?

For a contributor:

- What role do I hold?
- Which circle or working group am I part of?
- What authority do I have?
- What do I need to consult before deciding?
- Which tensions are assigned to me?
- What evidence do I need to provide?

For an admin or steward:

- Is the organization configured?
- Which template is being used?
- Which roles, circles, permissions, and policies are active?
- Which proposals need review?
- Which follow-up records are blocked or late?
- Which data is stale, missing, or unknown?
- Which external adapters are connected and what maturity level do they have?

For a technical developer:

- Which layer owns this data?
- Which repository owns the implementation?
- Which source has authority for this field?
- Which read model or API surface is involved?
- Which adapter imported this record?

The same product can serve all groups if it keeps the main record plain and routes technical details to the developer page.

## 18. Technical Architecture Overview

IsoniaOS is split into focused public components:

- EVM contracts model contract-backed organization authority, roles, policy routes, proposal checks, and execution receipts.
- Control Plane indexes events, stores raw records, builds read models, exposes diagnostics, imports or links external records where scoped, and provides REST read APIs.
- Shared types define common data shapes used across services and frontends.
- SDK provides typed clients and helpers for Control Plane consumers.
- App Core is the governance console used to view organizations, purpose, roles, circles, tensions, proposals, accountability, evidence, diagnostics, and configured wallet interactions.
- Theme Default provides default presentation assets and theme values.
- Integration Lab validates provider assumptions outside core product authority.
- Docs explain product concepts, user flows, technical boundaries, and public roadmap direction.

This architecture is intentionally layered:

```mermaid
flowchart TD
  User["User"] --> App["App Core"]
  App --> SDK["SDK"]
  SDK --> API["Control Plane"]
  API --> ReadModels["Read models"]
  API --> External["External adapters"]
  External --> Safe["Safe / wallets"]
  External --> GovTools["Snapshot / Tally / Agora / Aragon / DAOHaus / Colony / XDAO"]
  External --> Discussion["Telegram / Discord / forums / Slack"]
  API --> Contracts["EVM contracts"]
  Contracts --> API
  Types["Shared types"] --> SDK
  Types --> API
  Types --> App
  AI["AI facilitation"] --> API
  AI --> App
```

The technical model should preserve authority rather than blur it. A read API can explain contract state. It should not silently become the authority for contract-backed facts. An AI summary can help users understand a discussion. It should not silently become a decision.

## 19. Privacy, Safety, And Limitations

IsoniaOS records governance information. That information can affect people, budgets, reputations, contributor relationships, and community decisions.

Public records should avoid secrets, private keys, private endpoints, private customer data, private employment records, sensitive contributor data, and misleading claims. Evidence should be linked only when the organization is comfortable making the record public or has a clear policy for restricted access.

Discussion ingestion needs special care. Chat platforms can contain private messages, personal information, informal speech, deleted content, privileged context, or moderation-sensitive material. IsoniaOS should support source disclosure, redaction, permission boundaries, and clear import status rather than silently turning every message into permanent public evidence.

Current limitations:

- IsoniaOS is in developer-preview work.
- Some user flows are planned or partial.
- Exact behavior can differ by repository and current branch.
- Read models can lag the source they represent.
- External records can be stale, missing, incomplete, rate-limited, permissioned, or wrong.
- AI summaries can be useful, but they can omit context or make mistakes.
- Manual notes are useful, but they are not automatic proof.
- Integration adapters need evidence gates before public maturity claims.
- Production operation, audit completion, public beta completion, provider-completeness, AI-safety completeness, legal readiness, and security completeness are not claimed by these docs.

These limitations are not a reason to hide information. They are a reason to show status clearly.

## 20. Roadmap Relationship

The roadmap is directional. It explains how the product grows from early lifecycle modeling into public beta and later broader organization workflows.

Near-term work focuses on the proposal-to-proof loop: organization setup, activation, roles, templates, proposals, execution evidence, accountability records, diagnostics, and better user flows.

The self-management direction extends that loop with purpose, tensions, circles, decision modes, policies, advice process, consent process, discussion-source ingestion, AI facilitation, external integrations, dispute records, and organization health views.

Integration work should be sequenced carefully. Safe, Snapshot, Tally, Agora, Aragon, DAOHaus, Colony, XDAO, Telegram, Discord, forums, Slack, and other platforms should enter the roadmap as staged adapters with source-disclosure, trust-boundary, privacy, and maturity labels.

The roadmap is not a promise that a feature is complete. It uses checkboxes to separate current evidence from planned work.

## 21. Glossary And Key Terms

For short definitions, see the [Glossary](reference/glossary.md).

Key terms:

- governance lifecycle;
- accountable self-management;
- teal governance;
- organization;
- purpose;
- activation;
- circle;
- role;
- permission;
- policy;
- template;
- tension;
- advice process;
- consent process;
- proposal;
- decision;
- decision mode;
- execution;
- evidence;
- verification;
- accountability;
- discussion source;
- integration adapter;
- AI facilitation;
- governance memory;
- authority boundary.
