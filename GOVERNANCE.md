# IsoniaOS Governance

**Version:** Draft v0.2
**Status:** Draft
**Project:** IsoniaOS
**Language:** English

---

## 1. Purpose

This document defines the draft v0.2 governance model for ISO-based IsoniaOS governance.

The model is identity-aware, Council-supervised, constitution-bounded, and designed to reduce direct capital capture without removing the economic role of ISO.

---

## 2. Governance Principles

- Holding ISO is not the same as active governance participation.
- Governance power requires verified identity and governance activation/staking.
- The ERC-20 token must remain simple and compatible.
- Governance complexity belongs in governance modules, not token transfer logic.
- Critical proposals should use matured voting power.
- AI may assist interpretation, but it is not final authority.
- Governance must remain bounded by the IsoniaOS Constitution and legal constraints.

---

## 3. Governance Activation and Staking

Holding ISO is not the same as active governance participation.

Governance power requires:

1. verified identity through `IdentityRegistry`;
2. governance activation/staking through `GovernanceVault`;
3. cooldown maturity;
4. voting eligibility threshold satisfaction.

Cooldown is calculated from the staking/governance activation timestamp, not from token purchase timestamp. Tokens bought OTC or on a DEX do not bypass governance cooldown.

Cooldown schedule:

| Time after staking | Governance power |
| --- | ---: |
| `0-7 days` | `0%` |
| `8-30 days` | `25%` |
| `31-90 days` | `50%` |
| `91-180 days` | `75%` |
| `180+ days` | `100%` |

This protects against flash governance attacks. The cooldown should be implemented through stake lots or equivalent accounting.

---

## 4. Voting Eligibility Threshold

```text
VotingEligibilityThreshold = max(100 ISO, 0.0001% of GovernanceReferenceSupply)
```

`GovernanceReferenceSupply` is a predefined reference supply used for governance thresholds. It must be defined separately from circulating supply and `CurveSupplyCap`.

The threshold is hybrid to preserve accessibility while preventing dust-account spam.

Proposal creation threshold:

```text
ProposalCreationThreshold = max(1,000 ISO, 0.001% of GovernanceReferenceSupply)
```

Alternative proposal path:

- A proposal can be created with support from a sufficient number of verified identities.
- Draft placeholder: 50 verified identities, unless the repo later defines a different governance design.

---

## 5. Logarithmic Voting Power and x10 Cap

```text
if effectiveStake < VotingEligibilityThreshold:
  voicePower = 0

else:
  voicePower = min(
    10,
    1 + 9 * ln(effectiveStake / VotingEligibilityThreshold)
          / ln(CapStake / VotingEligibilityThreshold)
  )
```

Draft:

```text
CapStake = 0.1% of GovernanceReferenceSupply
```

Rules:

- A verified participant with the minimum threshold receives 1 voice unit.
- One verified identity cannot exceed 10 own voice units.
- Additional capital can still matter economically, but it cannot create unlimited direct voting power.
- Delegated voting power must be tracked separately from own identity power.
- A Council member's own identity power is capped, but delegated power may be shown separately.

---

## 6. Progressive Whale Premium / Governance Concentration Premium

Whale premium is not applied to normal ERC-20 transfers.

Whale premium is not fee-on-transfer.

Whale premium applies to primary ISO purchases through the bonding curve.

Governance Concentration Premium may also apply during governance activation/staking when a verified identity attempts to activate a large amount of ISO for governance participation.

This protects governance without breaking ERC-20 compatibility.

Draft thresholds by verified identity:

| Identity amount | Premium |
| --- | ---: |
| `0-0.10%` of `GovernanceReferenceSupply` | no premium |
| `0.10-0.25%` | `+5%` premium on the excess portion |
| `0.25-0.50%` | `+15%` premium on the excess portion |
| `0.50-1.00%` | `+35%` premium on the excess portion |
| `1.00-2.00%` | `+75%` premium on the excess portion |
| Above `2.00%` | governance activation requires Council/governance review |

Premiums apply to the excess portion above each threshold, not to the entire balance, to avoid cliff effects.

Premium destination:

- Premiums go to Protocol Treasury / fee funds.
- Premiums do not go to Curve Reserve.
- Premiums are not distributed to stakers at launch.

---

## 7. IsoniaOS Protocol Council

The governance body is called IsoniaOS Protocol Council.

It is not called Board of Directors in public docs to avoid confusion with corporate shareholder rights.

Rules:

- Council has 11 seats.
- Council members are elected by verified governance participants.
- Small stakers may delegate voting power to Council members or candidates.
- Council members must maintain public profiles.

Council profile fields:

- name or organization;
- jurisdiction;
- verified identity status;
- expertise;
- public statement / manifesto;
- conflicts of interest;
- own ISO stake;
- Council bond;
- delegated voting power;
- voting history;
- attendance;
- rationale history;
- missed votes;
- penalties or slashing history;
- AI-generated constitution alignment summary, if available.

Council responsibilities:

- review major proposals;
- vote on critical governance matters;
- publish rationale for votes;
- respond to People's Veto events;
- supervise treasury decisions within constitutional bounds;
- oversee legal fund execution;
- protect protocol integrity;
- participate in emergency sessions when required.

---

## 8. Council Bond

Early-stage bond should be intentionally small and governance-adjustable.

Draft Phase 1 Council Bond: 1,000 ISO.

Mature target may be increased by governance, for example toward 5,000 ISO or another approved value.

Rules:

- Bond is locked for the Council term plus a post-term review period.
- Community-sponsored bonds are allowed.
- Candidate should personally contribute a minimum portion of the bond, draft 20%, to preserve skin in the game.

---

## 9. Council Slashing

Slashing must only apply to objective violations, not political opinions.

Examples:

- repeated missed critical votes;
- systematic inactivity;
- undisclosed conflict of interest;
- bribery or collusion;
- constitution violation;
- client confidentiality breach;
- governance attack.

Slashed funds destination:

- 50% Security & Audit Fund;
- 25% Legal & Compliance Fund;
- 25% Community Grants Fund.

---

## 10. People's Veto

IsoniaOS governance includes direct public-trust signals from verified participants.

Delegation to Council does not remove the right of verified participants to express dissent.

### Soft People's Veto

Soft People's Veto:

- does not automatically block a proposal;
- triggers Public Trust Warning;
- requires additional explanation period;
- requires AI-generated summary of objections;
- requires Council response;
- may require a second vote after timelock.

### Hard People's Veto

Hard People's Veto applies only to critical decisions, such as:

- IP transfer;
- domain transfer;
- GitHub organization transfer;
- trademark transfer;
- treasury withdrawal above defined threshold;
- tokenomics changes;
- Curve Reserve rule changes;
- future revenue-sharing activation;
- foundation bylaws change;
- emergency powers extension.

Draft trigger:

- 33%+ of active verified identities vote against;
- identity quorum is reached;
- objection period is complete.

This is a draft parameter subject to final governance design.

---

## 11. IsoniaOS Constitution

IsoniaOS should operate under a written constitution.

The constitution defines:

- limits of governance power;
- treasury rules;
- Council obligations;
- proposal lifecycle;
- conflict-of-interest rules;
- emergency powers;
- transparency requirements;
- future economic module activation requirements.

The constitution should constrain governance from using ordinary votes to bypass reserve rules, legal review, identity requirements, or disclosure obligations.

---

## 12. AI Proposal Validation

AI validation is an interpretability and compliance-assistance layer, not an ultimate authority.

AI should:

- summarize proposals;
- detect potential constitution conflicts;
- highlight risks;
- explain trade-offs;
- summarize public objections;
- help participants inspect proposal history and similar decisions.

Final authority remains with governance, Council, and applicable legal structures.

AI outputs should be labeled advisory and should cite source context where available.

---

## 13. Proposal Flow

```text
Verified participant or Council member
-> proposal submission
-> AI validation
-> constitution check
-> discussion period
-> vote
-> possible Soft People's Veto or Hard People's Veto
-> timelock
-> execution if approved
```

Critical decisions should have higher quorum, matured voting power, Council review, timelock, and People's Veto checks.

---

## 14. Legal Boundary

ISO governance does not create shareholder rights, equity rights, dividend rights, or guaranteed economic participation.

No revenue-sharing rights exist at launch. Any future economic participation module will require a separate governance proposal, independent legal review, updated disclosures, and, where required, a regulated structure.
