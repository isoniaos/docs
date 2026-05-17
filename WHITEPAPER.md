# IsoniaOS: Accountable Governance Architecture

**Version:** Draft v0.2
**Status:** Working whitepaper
**Project:** IsoniaOS
**Token name:** Isonia
**Token symbol:** ISO
**Primary market:** DAO and Web3 governance
**Language:** English

---

## 1. Executive Summary

IsoniaOS is a governance architecture layer for accountable digital organizations.

The project is not only a voting surface. IsoniaOS is designed to make authority visible, scoped, delegated, constrained, auditable, and eventually recallable. It connects proposal drafting, review, voting, execution, accountability, treasury policy, identity-aware participation, and institutional memory into one governance lifecycle.

The core thesis remains:

```text
Governance is not a vote. Governance is a lifecycle.
```

The v0.2 design adds the planned ISO tokenomics, Curve Reserve invariant, identity-based governance model, IsoniaOS Protocol Council, treasury funds, legal-phasing roadmap, and ETH alignment layer.

This whitepaper is a design draft. It is not legal advice, tax advice, investment advice, an audit report, or a claim that any token launch is approved in any jurisdiction.

---

## 2. Isonia / ISO Token Overview

ISO is the planned governance/economic token of IsoniaOS.

- Token name: Isonia.
- Token symbol: ISO.
- ISO is intended to support protocol funding, governance participation, and long-term ecosystem alignment.
- ISO does not provide revenue-sharing rights at launch.
- ISO does not represent equity in any legal entity.
- ISO should not be described as shares, dividends, profit rights, passive income, or guaranteed yield.
- Future value-accrual or economic participation mechanisms are conditional and require legal review, governance approval, and updated disclosures.

No revenue-sharing rights exist at launch. Any future economic participation module will require a separate governance proposal, independent legal review, updated disclosures, and, where required, a regulated structure.

The ISO ticker is intended for the Isonia token, but this whitepaper does not claim that ISO is globally unique as a ticker.

---

## 3. Immutable Bonding Curve

The planned primary issuance mechanism is an immutable polynomial bonding curve.

```text
P(S) = P0 * (1 + S / B)^k
```

Where:

- `P(S)` is the spot mint price of the next ISO token.
- `P0 = 1 USDC`.
- `k = 1.15`.
- `B = CurveSupplyCap / 10`.
- `S` is the amount of ISO already issued through the bonding curve.
- `CurveSupplyCap` is the maximum amount of ISO that can be issued through the bonding curve.

`P0`, `k`, `B`, `CurveSupplyCap`, and the core integral formula are immutable after public launch. Governance may manage limited operational parameters only within pre-defined constitutional bounds.

The curve is polynomial, not exponential. It is designed to balance early support incentives with long-term fairness and resistance to governance capture.

Buyers pay the integral under the curve, not simply spot price multiplied by amount:

```text
baseCost(amount) =
P0 * B / (k + 1) *
[
  (1 + (S + amount) / B)^(k + 1)
  -
  (1 + S / B)^(k + 1)
]
```

Sellers receive the reverse integral, minus sell fee:

```text
baseReturn(amount) =
P0 * B / (k + 1) *
[
  (1 + S / B)^(k + 1)
  -
  (1 + (S - amount) / B)^(k + 1)
]
```

Fees and premiums are separate from the Curve Reserve.

Illustrative example only, using `CurveSupplyCap = 10,000,000 ISO`:

| Curve-issued supply `S` | Approximate spot price |
| --- | ---: |
| `0` | `1.00 USDC` |
| `1,000,000` | `2.22 USDC` |
| `3,000,000` | `4.92 USDC` |
| `5,000,000` | `7.85 USDC` |
| `10,000,000` | `15.76 USDC` |

These numbers are not final launch supply parameters. They show how the formula behaves under one illustrative cap.

---

## 4. Curve Reserve Invariant

Curve Reserve is not treasury.

Curve Reserve is not protocol revenue.

Curve Reserve is not operational runway.

Curve Reserve exists to support redemptions through the bonding curve. Base USDC paid for ISO mints goes to Curve Reserve. Curve Reserve must not be spent on salaries, grants, infrastructure, legal work, marketing, or operations.

Only fees, premiums, SaaS contributions, grants, and donations can be treated as protocol revenue or treasury income. This invariant should be enforced at the smart contract architecture level, not only by policy.

---

## 5. Reserve Asset Decision: USDC Curve Reserve, ETH Alignment Layer

Launch bonding curve remains denominated in native USDC. Launch Curve Reserve remains native USDC-only.

ETH is not the launch redemption asset. ETH is not the launch unit of account for the ISO bonding curve.

The decision is based on redemption predictability, accounting clarity, legal fund stability, and simpler smart contract security. USDC has issuer, blacklisting, depeg, and regulatory risks. ETH has stronger decentralization properties, but introduces reserve volatility and accounting uncertainty. ETH-denominated reserves may increase market volatility, but also make ISO/USD price depend on ETH/USD movements.

Reserve volatility should not be used as a substitute for product value, governance credibility, or protocol adoption.

```text
Reserve should be boring. Token upside should come from adoption, utility, governance demand and legally compliant future value-accrual mechanisms, not from unnecessary reserve volatility.
```

ETH may be used for grants, donations, non-reserve treasury allocations, Ethereum-native integrations, and future payment adapter research. ETH held in treasury funds does not create ETH redemption rights for ISO holders and must not be marketed as backing for ISO redemptions.

---

## 6. USDC-Only Settlement

The bonding curve uses native USDC only.

IsoniaOS should not support USDT, EURC, ETH, or multiple stablecoins as launch bonding curve settlement or redemption assets. Multiple stablecoins would increase oracle, accounting, security, depeg, and user-experience complexity. ETH improves decentralization properties in some contexts, but it is not the launch reserve or redemption asset.

If USDC becomes materially impaired, frozen, unavailable, depegged, or legally unsuitable, the protocol may pause new mint/redeem operations and initiate a governance-controlled migration process. The documentation must be honest that if the Curve Reserve address itself is blacklisted or frozen, governance migration may not be able to recover the frozen USDC and the event could become an existential operational risk.

---

## 7. ERC-20 Design

ISO should be a standard ERC-20 token.

The token contract should have:

- no fee-on-transfer;
- no transfer tax;
- no identity checks inside ERC-20 transfer logic;
- no whale premium on simple ERC-20 transfers;
- no complex governance logic inside the token contract.

The ERC-20 should remain maximally compatible with DEXs, wallets, indexers, accounting systems, and bridges.

Complexity should live in separate modules:

- `BondingCurve`;
- `GovernanceVault`;
- `IdentityRegistry`;
- `TreasurySplitter`;
- `CouncilRegistry` or equivalent governance module.

---

## 8. Progressive Whale Premium / Governance Concentration Premium

Whale premium is not applied to normal ERC-20 transfers. It is not fee-on-transfer.

Whale premium applies to primary ISO purchases through the bonding curve. A Governance Concentration Premium may also apply during governance activation/staking when a verified identity attempts to activate a large amount of ISO for governance participation. This protects governance without breaking ERC-20 compatibility.

Draft thresholds by verified identity:

| Activated or purchased amount by verified identity | Premium on excess portion |
| --- | ---: |
| `0-0.10%` of `GovernanceReferenceSupply` | `0%` |
| `0.10-0.25%` | `+5%` |
| `0.25-0.50%` | `+15%` |
| `0.50-1.00%` | `+35%` |
| `1.00-2.00%` | `+75%` |
| Above `2.00%` | Council/governance review required |

Premiums apply only to the excess portion above each threshold, not to the entire balance, to avoid cliff effects. Premiums go to Protocol Treasury / fee funds. Premiums do not go to Curve Reserve and are not distributed to stakers at launch.

---

## 9. Protocol-Owned Reference Liquidity and Arbitrage

ISO can trade on external venues such as DEXs and OTC markets. The protocol cannot and should not prevent external markets.

The bonding curve acts as an official mint/redeem venue and price reference.

When external price is above the bonding curve mint price plus fees, arbitrageurs may mint through the protocol and sell externally. When external price is below the bonding curve redemption price minus fees, arbitrageurs may buy externally and redeem through the protocol.

The protocol earns fees only from operations performed through the bonding contract. This mechanism is not a promise of profit to users.

---

## 10. Treasury Funds

IsoniaOS must clearly separate Curve Reserve from treasury funds.

1. Curve Reserve receives `baseCost` from bonding curve mints and pays redemptions. It is not spendable for operations.
2. Protocol Treasury / Fee Treasury receives protocol revenue sources.

Protocol revenue sources may include:

- buy fees;
- sell fees;
- progressive whale premiums;
- governance activation premiums;
- SaaS contributions;
- grants;
- donations.

Initial fee distribution draft:

| Fund | Draft share |
| --- | ---: |
| Protocol Treasury Fund | `40%` |
| Legal & Compliance Fund | `20%` |
| Security & Audit Fund | `15%` |
| Operations Reserve | `15%` |
| Market Stability & Ethereum Alignment Fund | `10%` |

This split is a draft governance parameter and may be changed only within constitutional bounds.

The Market Stability & Ethereum Alignment Fund is not part of the Curve Reserve. It may hold ETH, USDC, or other governance-approved assets. ETH held by this fund does not create ETH redemption rights for ISO holders and must not be marketed as backing for ISO redemptions.

---

## 11. Legal & Compliance Fund

The Legal & Compliance Fund exists to finance legal reviews, governance structuring, regulatory analysis, entity setup, token classification work, privacy documentation, and future value-accrual feasibility.

Specialists should be engaged as early as practically possible after the fund receives sufficient resources. Future revenue-sharing or economic participation mechanisms require independent legal review before activation. Legal service providers or executors should be approved through governance or Council-supervised procurement.

---

## 12. Governance Activation and Staking

Holding ISO is not the same as active governance participation.

Governance power requires verified identity and governance activation/staking. Cooldown is calculated from the staking/governance activation timestamp, not from token purchase timestamp. Tokens bought OTC or on a DEX do not bypass governance cooldown.

Cooldown schedule:

| Time after staking | Governance power |
| --- | ---: |
| `0-7 days` | `0%` |
| `8-30 days` | `25%` |
| `31-90 days` | `50%` |
| `91-180 days` | `75%` |
| `180+ days` | `100%` |

This protects against flash governance attacks. Critical proposals should use matured voting power. The cooldown should be implemented through stake lots or equivalent accounting.

---

## 13. Voting Eligibility Threshold

```text
VotingEligibilityThreshold = max(100 ISO, 0.0001% of GovernanceReferenceSupply)
```

`GovernanceReferenceSupply` is a predefined reference supply used for governance thresholds. It must be defined separately from circulating supply and `CurveSupplyCap`.

The threshold is hybrid to preserve accessibility while preventing dust-account spam.

```text
ProposalCreationThreshold = max(1,000 ISO, 0.001% of GovernanceReferenceSupply)
```

A proposal can also be created with support from a sufficient number of verified identities. Draft placeholder: 50 verified identities, unless superseded by a later approved governance design.

---

## 14. Logarithmic Voting Power and x10 Cap

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

A verified participant with the minimum threshold receives 1 voice unit. One verified identity cannot exceed 10 own voice units.

Additional capital can still matter economically, but it cannot create unlimited direct voting power. Delegated voting power must be tracked separately from own identity power. A Council member's own identity power is capped, but delegated power may be shown separately.

---

## 15. Identity Registry

IsoniaOS governance relies on a single `IdentityRegistry` as the source of truth for verified participants.

The ERC-20 token itself does not perform identity checks. `GovernanceVault`, `BondingCurve`, `CouncilRegistry`, and other governance modules may query `IdentityRegistry`.

Example minimal interface:

```solidity
interface IIdentityRegistry {
    function identityOf(address wallet) external view returns (bytes32);
    function isVerified(bytes32 identityId) external view returns (bool);
    function identityType(bytes32 identityId) external view returns (uint8);
    function expiresAt(bytes32 identityId) external view returns (uint256);
}
```

No personal data should be stored on-chain. Store only identity status, identity hash/id, type, expiry, and revocation state. Identity may represent a verified human or verified legal entity. Multiple wallets may map to one identity. Governance logic is based on verified identity, not individual wallet address.

`IdentityRegistry` should support modular verifier adapters. New adapters can be added through governance. Examples include KYC provider adapter, KYB provider adapter, EAS adapter, Privado ID adapter, World ID adapter, Proof of Humanity adapter, and manual Council review adapter. Adding or removing adapters should require governance approval, timelock, and potentially Council oversight.

---

## 16. IsoniaOS Protocol Council

The governance body is called IsoniaOS Protocol Council. It is not called Board of Directors in public docs to avoid confusion with corporate shareholder rights.

The Council has 11 seats. Council members are elected by verified governance participants. Small stakers may delegate voting power to Council members or candidates. Council members must maintain public profiles.

Council profile fields should include name or organization, jurisdiction, verified identity status, expertise, public statement or manifesto, conflicts of interest, own ISO stake, Council bond, delegated voting power, voting history, attendance, rationale history, missed votes, penalties or slashing history, and AI-generated constitution alignment summary if available.

Council responsibilities include major proposal review, votes on critical governance matters, published vote rationales, responses to People's Veto events, treasury supervision within constitutional bounds, legal fund oversight, protocol integrity protection, and emergency sessions when required.

Early-stage Council bond should be intentionally small and governance-adjustable. Draft Phase 1 Council Bond: 1,000 ISO. A mature target may be increased by governance, for example toward 5,000 ISO or another approved value. The bond is locked for the Council term plus a post-term review period. Community-sponsored bonds are allowed. Candidate should personally contribute a minimum portion of the bond, draft 20%, to preserve skin in the game.

Slashing must only apply to objective violations, not political opinions. Examples include repeated missed critical votes, systematic inactivity, undisclosed conflict of interest, bribery or collusion, constitution violation, client confidentiality breach, and governance attack.

Slashed funds destination:

- 50% Security & Audit Fund;
- 25% Legal & Compliance Fund;
- 25% Community Grants Fund.

---

## 17. People's Veto

IsoniaOS governance includes direct public-trust signals from verified participants. Delegation to Council does not remove the right of verified participants to express dissent.

Soft People's Veto does not automatically block a proposal. It triggers a Public Trust Warning, requires an additional explanation period, requires an AI-generated summary of objections, requires Council response, and may require a second vote after timelock.

Hard People's Veto applies only to critical decisions, such as IP transfer, domain transfer, GitHub organization transfer, trademark transfer, treasury withdrawal above a defined threshold, tokenomics changes, Curve Reserve rule changes, future revenue-sharing activation, foundation bylaws change, or emergency powers extension.

Draft trigger:

- 33%+ of active verified identities vote against;
- identity quorum is reached;
- objection period is complete.

This is a draft parameter subject to final governance design.

---

## 18. IsoniaOS Constitution

IsoniaOS should operate under a written constitution.

The constitution defines limits of governance power, treasury rules, Council obligations, proposal lifecycle, conflict-of-interest rules, emergency powers, transparency requirements, and future economic module activation requirements.

### AI Proposal Validation

AI validation is an interpretability and compliance-assistance layer, not an ultimate authority.

AI should summarize proposals, detect potential constitution conflicts, highlight risks, explain trade-offs, and summarize public objections. Final authority remains with governance, Council, and applicable legal structures.

---

## 19. Two-Entity Structure Roadmap

The mature target structure is:

1. A Portuguese association / foundation-like entity for domains, GitHub organization, open-source IP, trademarks, governance constitution, public treasury coordination, grants, and Protocol Council process.
2. A separate commercial company, likely an Lda, for SaaS, enterprise deployments, custom integrations, support contracts, consulting, private deployments, SLA, payroll, and operational invoices.

These entities should not be described as already existing unless confirmed by future legal/entity documentation. This is a roadmap item to be executed as funds become available.

### Commercial Transparency and Confidentiality

IsoniaOS should balance public accountability with client confidentiality. Commercial clients may not want their identity, exact contract terms, or exact payment amounts disclosed.

The commercial entity should publish periodic aggregated reports without deanonymizing clients.

Quarterly report draft fields:

- total SaaS revenue;
- total enterprise/custom revenue;
- total support revenue;
- total infrastructure costs;
- total payroll/admin costs;
- contribution to association/treasury;
- runway estimate;
- risk notes;
- client concentration ranges without naming clients.

Individual client names, exact invoices, private terms, SLA details, and custom technical details should not be disclosed unless explicitly permitted.

### Phased Transfer of Non-Profit Governance

Phase 1: Founder/team controls the association/foundation-like entity. Protocol Council is advisory.

Phase 2: Council receives veto on IP, domain, GitHub, trademark transfer, and major treasury movement.

Phase 3: Council approves major protocol grants, legal fund executors, and public roadmap changes.

Phase 4: Council appoints/removes part of the association/foundation board.

Phase 5: Association/foundation bylaws formally recognize Protocol Council as a core governance body.

---

## 20. ETH Grants, Donations, and Future Adapters

IsoniaOS may receive grants or donations in ETH. ETH grants/donations should go to treasury funds, not Curve Reserve, unless governance and legal review explicitly approve otherwise. Grant-funded work should be documented separately from ISO token sale economics.

Public-good components such as governance tooling, AI proposal validation, identity-aware voting, and treasury transparency should be positioned independently from speculative tokenomics.

A future ETH Payment Adapter may allow users to pay ETH while the bonding curve still receives native USDC. The adapter would swap ETH to USDC through an approved DEX route before minting ISO. ISO minting should only occur after the `BondingCurve` contract receives the required USDC amount.

Future ETH Payment Adapter flow:

```text
User pays ETH
-> ETH Payment Adapter
-> approved DEX swap ETH to USDC
-> BondingCurve receives USDC
-> ISO is minted
-> baseCost goes to Curve Reserve
-> fees/premiums go to TreasurySplitter
```

This preserves the USDC Curve Reserve while improving Ethereum-native UX. This feature requires separate specification, MEV/slippage analysis, security review, and governance approval. It is not launch scope unless explicitly approved later.

ETH-denominated bonding curve reserves may be researched in the future but are not part of the launch design. No ETH-denominated reserve migration should be promised. Any reserve asset change requires governance approval, independent legal review, security review, and updated disclosures.

---

## 21. Architecture Summary

Primary buy flow:

```text
User
-> BondingCurve
-> IdentityRegistry check
-> calculate baseCost
-> calculate buy fee
-> calculate whale premium if applicable
-> USDC baseCost to Curve Reserve
-> fees/premiums to TreasurySplitter
-> mint ISO to user
```

Redeem flow:

```text
User
-> BondingCurve
-> burn ISO
-> calculate baseReturn
-> subtract sell fee
-> USDC payout from Curve Reserve
-> fee to TreasurySplitter
```

Governance activation flow:

```text
User
-> GovernanceVault
-> IdentityRegistry check
-> stake ISO
-> calculate concentration premium if applicable
-> create cooldown lot
-> calculate effectiveStake over time
-> calculate voicePower with x10 cap
```

Proposal flow:

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

---

## 22. Legal and Risk Posture

IsoniaOS must avoid premature legal conclusions. The token, treasury, identity, Council, and future economic participation design require independent legal review before launch or activation.

Key constraints:

- no revenue-sharing rights at launch;
- no yield promises;
- no equity language;
- no guaranteed return language;
- no claim that Curve Reserve funds operations;
- no claim that ETH backs ISO redemptions at launch;
- no claim that USDC risk is zero.

Legal phasing, treasury policy, risk register, and decision log are maintained in separate top-level docs.

---

## 23. Related Documents

- [Tokenomics](TOKENOMICS.md)
- [Governance](GOVERNANCE.md)
- [Identity](IDENTITY.md)
- [Treasury](TREASURY.md)
- [Legal Roadmap](LEGAL_ROADMAP.md)
- [Risk Register](RISK_REGISTER.md)
- [Decision Log](DECISION_LOG.md)
- [Architecture](ARCHITECTURE.md)
- [Roadmap](ROADMAP.md)

---

## 24. Conclusion

IsoniaOS is a governance architecture layer for accountable digital organizations. The ISO design is intended to fund and coordinate the protocol without confusing treasury, reserve, governance, identity, or legal roles.

The launch design is deliberately conservative: standard ERC-20, native USDC-only bonding curve reserve, immutable curve formula, Curve Reserve isolation, identity-aware governance, capped logarithmic voice power, Protocol Council oversight, legal fund phasing, and no revenue-sharing rights at launch.

Final authority remains with the governance process, applicable legal structures, and audited contracts when those contracts are deployed.
