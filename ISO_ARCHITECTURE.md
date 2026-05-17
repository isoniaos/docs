# ISO Funding and Protocol Self-Governance Architecture

**Version:** Draft v0.2
**Status:** Draft
**Project:** IsoniaOS
**Language:** English

---

## 1. Purpose

This document describes the high-level draft v0.2 architecture for ISO issuance, reserve accounting, treasury routing, identity-aware governance activation, Council governance, and future ETH alignment.

This is a supporting architecture layer for IsoniaOS itself. It is not the main IsoniaOS product architecture.

It is documentation-only and does not define deployed contracts.

---

## 2. Core Modules

Draft modules:

- `ISO`: standard ERC-20 token.
- `BondingCurve`: primary ISO mint/redeem venue.
- `CurveReserve`: native USDC-only redemption reserve.
- `TreasurySplitter`: routes fees and premiums to treasury funds.
- `GovernanceVault`: governance activation/staking and cooldown lots.
- `IdentityRegistry`: source of truth for verified identities.
- `CouncilRegistry`: Council seats, candidate profiles, bonds, delegations, and slashing records.
- `ProposalEngine`: proposal lifecycle, votes, timelocks, and execution routing.
- `AIPolicyValidator`: advisory proposal validation and summaries.
- `ConstitutionRegistry`: reference to constitution rules and versioned policy constraints.

The exact names may change during technical specification. The boundaries should remain clear.

---

## 3. ERC-20 Boundary

ISO should be a standard ERC-20 token.

The token contract should keep these exclusions:

- no fee-on-transfer logic;
- no transfer tax;
- no identity checks inside transfer logic;
- no whale premium on simple ERC-20 transfers;
- no complex governance logic.

The token should remain compatible with DEXs, wallets, indexers, accounting systems, and bridges.

---

## 4. Immutable Bonding Curve

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

`P0`, `k`, `B`, `CurveSupplyCap`, and the core integral formula are immutable after public launch.

Purchase formula:

```text
baseCost(amount) =
P0 * B / (k + 1) *
[
  (1 + (S + amount) / B)^(k + 1)
  -
  (1 + S / B)^(k + 1)
]
```

Redemption formula:

```text
baseReturn(amount) =
P0 * B / (k + 1) *
[
  (1 + S / B)^(k + 1)
  -
  (1 + (S - amount) / B)^(k + 1)
]
```

Fees and premiums are separate from Curve Reserve.

---

## 5. Primary Buy Flow

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

Notes:

- Launch settlement asset is native USDC only.
- `baseCost` goes to Curve Reserve.
- Fees and premiums go to treasury funds.
- Whale premium applies to bonding curve purchases, not ERC-20 transfers.

---

## 6. Redeem Flow

```text
User
-> BondingCurve
-> burn ISO
-> calculate baseReturn
-> subtract sell fee
-> USDC payout from Curve Reserve
-> fee to TreasurySplitter
```

Notes:

- Launch redemption asset is native USDC only.
- ETH is not the launch redemption asset.
- Sell fee is separate from Curve Reserve.

---

## 7. Governance Activation Flow

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

Cooldown schedule:

| Time after staking | Governance power |
| --- | ---: |
| `0-7 days` | `0%` |
| `8-30 days` | `25%` |
| `31-90 days` | `50%` |
| `91-180 days` | `75%` |
| `180+ days` | `100%` |

Cooldown is based on activation/staking timestamp, not purchase timestamp.

---

## 8. Voting Power Formula

```text
VotingEligibilityThreshold = max(100 ISO, 0.0001% of GovernanceReferenceSupply)
```

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

Delegated voting power must be tracked separately from own identity power.

---

## 9. Proposal Flow

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

AI validation is advisory. Final authority remains with governance, Council, and applicable legal structures.

---

## 10. Treasury Flow

```text
BondingCurve baseCost
-> Curve Reserve
-> redemption payouts only
```

```text
buy fees / sell fees / whale premiums / activation premiums
-> TreasurySplitter
-> Protocol Treasury Fund
-> Legal & Compliance Fund
-> Security & Audit Fund
-> Operations Reserve
-> Market Stability & Ethereum Alignment Fund
```

Curve Reserve must not fund operations.

---

## 11. Reserve Asset Decision: USDC Curve Reserve, ETH Alignment Layer

Launch bonding curve remains denominated in native USDC.

Launch Curve Reserve remains native USDC-only.

ETH is not the launch redemption asset.

ETH is not the launch unit of account for ISO bonding curve.

The decision is based on redemption predictability, accounting clarity, legal fund stability, and simpler smart contract security.

USDC has issuer, blacklisting, depeg, and regulatory risks. ETH has stronger decentralization properties, but introduces reserve volatility and accounting uncertainty.

ETH-denominated reserves may increase market volatility, but also make ISO/USD price depend on ETH/USD movements.

Reserve volatility should not be used as a substitute for product value, governance credibility, or protocol adoption.

```text
Reserve should be boring. Token upside should come from adoption, utility, governance demand and legally compliant future value-accrual mechanisms, not from unnecessary reserve volatility.
```

---

## 12. USDC Risk Acknowledgement

USDC carries centralized issuer risk.

USDC may be subject to blacklisting, freezing, regulatory, or operational constraints.

The protocol should include a USDC impairment emergency clause allowing governance to pause new mint/redeem operations and begin a legally compliant migration procedure if USDC becomes materially impaired, frozen, unavailable, depegged, or legally unsuitable.

Do not imply that migration can recover funds if the Curve Reserve address itself becomes frozen. Blacklisting of the reserve address could be an existential operational risk.

---

## 13. Future ETH Payment Adapter

Future flow:

```text
User pays ETH
-> ETH Payment Adapter
-> approved DEX swap ETH to USDC
-> BondingCurve receives USDC
-> ISO is minted
-> baseCost goes to Curve Reserve
-> fees/premiums go to TreasurySplitter
```

Rules:

- Not launch scope.
- The adapter swaps ETH to USDC before minting.
- ISO minting occurs only after the `BondingCurve` receives required USDC.
- Requires separate specification, MEV/slippage analysis, audit, accounting review, and governance approval.

Risks:

- slippage;
- MEV;
- DEX dependency;
- quote manipulation;
- failed swap handling;
- audit complexity;
- accounting complexity.

---

## 14. Future ETH-Denominated Reserve Research

ETH-denominated bonding curve may be researched in the future but is not part of the launch design.

If researched, it must clearly define whether ISO price is denominated in ETH or USD-equivalent ETH.

If denominated in ETH, ISO/USD price will move with ETH/USD.

If denominated in USD-equivalent ETH, oracle and overcollateralization problems must be solved.

No ETH-denominated reserve migration should be promised.

Any reserve asset change requires governance approval, independent legal review, security review, and updated disclosures.

---

## 15. Architecture Invariants

- Curve Reserve is not treasury.
- Curve Reserve receives `baseCost` from bonding curve mints.
- Curve Reserve pays redemptions.
- Curve Reserve cannot be used for operations.
- Fees and premiums are not Curve Reserve.
- ISO ERC-20 transfers are standard and do not run identity checks.
- Governance power requires verified identity and activation/staking.
- ETH does not back launch redemptions.
- AI is advisory, not final authority.
- Future economic participation is conditional and legally reviewed.

---

## 16. Legal Boundary

No revenue-sharing rights exist at launch. Any future economic participation module will require a separate governance proposal, independent legal review, updated disclosures, and, where required, a regulated structure.
