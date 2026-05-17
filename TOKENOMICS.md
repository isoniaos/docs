# IsoniaOS Tokenomics

**Version:** Draft v0.2
**Status:** Draft
**Project:** IsoniaOS
**Token name:** Isonia
**Token symbol:** ISO
**Language:** English

---

## 1. Purpose

This document defines the draft v0.2 tokenomics architecture for ISO, the planned governance/economic token of IsoniaOS.

It is a design document, not an offer, legal opinion, audit report, or launch approval. Any token launch, sale, or value-accrual module requires independent legal review, security review, governance approval where applicable, and updated disclosures.

No revenue-sharing rights exist at launch. Any future economic participation module will require a separate governance proposal, independent legal review, updated disclosures, and, where required, a regulated structure.

---

## 2. Isonia / ISO Token Overview

- Token name: Isonia.
- Token symbol: ISO.
- ISO is the planned governance/economic token of IsoniaOS.
- ISO is intended to support protocol funding, governance participation, and long-term ecosystem alignment.
- ISO does not provide revenue-sharing rights at launch.
- ISO does not represent equity in any legal entity.
- ISO must not be described as shares, securities, dividends, profit rights, passive income, or guaranteed yield.
- Future value-accrual or economic participation mechanisms are conditional and require legal review, governance approval, and updated disclosures.

The ISO ticker is a project design choice. IsoniaOS does not claim that ISO is guaranteed to be unique as a ticker.

---

## 3. ERC-20 Design

ISO should be a standard ERC-20 token.

The token contract should have:

- no fee-on-transfer;
- no transfer tax;
- no identity checks inside ERC-20 transfer logic;
- no whale premium on simple ERC-20 transfers;
- no complex governance logic inside the token contract.

ERC-20 should remain maximally compatible with DEXs, wallets, indexers, accounting systems, and bridges.

Complexity should live in:

- `BondingCurve` contract;
- `GovernanceVault` contract;
- `IdentityRegistry` contract;
- `TreasurySplitter` contract;
- `CouncilRegistry` or equivalent governance module.

---

## 4. USDC-Only Settlement

The launch bonding curve uses native USDC only.

Do not support USDT, EURC, ETH, or multiple stablecoins as launch bonding curve settlement or redemption assets. Multiple stablecoins would increase oracle, accounting, security, depeg, and UX complexity.

Emergency clause: if USDC becomes materially impaired, frozen, unavailable, depegged, or legally unsuitable, the protocol may pause new mint/redeem operations and initiate a governance-controlled migration process.

This clause does not imply that migration can recover funds if the Curve Reserve address itself becomes frozen. Blacklisting or freezing of the reserve address could be an existential operational risk.

---

## 5. Reserve Asset Decision: USDC Curve Reserve, ETH Alignment Layer

Launch bonding curve remains denominated in native USDC.

Launch Curve Reserve remains native USDC-only.

ETH is not the launch redemption asset. ETH is not the launch unit of account for ISO bonding curve.

The decision is based on:

- redemption predictability;
- accounting clarity;
- legal fund stability;
- simpler smart contract security.

USDC has issuer, blacklisting, depeg, and regulatory risks. ETH has stronger decentralization properties, but introduces reserve volatility and accounting uncertainty.

ETH-denominated reserves may increase market volatility, but also make ISO/USD price depend on ETH/USD movements. Reserve volatility should not be used as a substitute for product value, governance credibility, or protocol adoption.

```text
Reserve should be boring. Token upside should come from adoption, utility, governance demand and legally compliant future value-accrual mechanisms, not from unnecessary reserve volatility.
```

---

## 6. Immutable Bonding Curve

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

---

## 7. Purchase Cost Formula

Buyers pay the integral under the curve, not simply spot price multiplied by amount.

```text
baseCost(amount) =
P0 * B / (k + 1) *
[
  (1 + (S + amount) / B)^(k + 1)
  -
  (1 + S / B)^(k + 1)
]
```

`baseCost` goes to Curve Reserve. Buy fees and whale premiums are separate and go to treasury funds through `TreasurySplitter`.

---

## 8. Redemption Formula

Sellers receive the reverse integral, minus sell fee.

```text
baseReturn(amount) =
P0 * B / (k + 1) *
[
  (1 + S / B)^(k + 1)
  -
  (1 + (S - amount) / B)^(k + 1)
]
```

The Curve Reserve pays the redemption base amount. Sell fees are separate from Curve Reserve and are routed to treasury funds.

---

## 9. Illustrative Curve Example

Illustrative example only, using `CurveSupplyCap = 10,000,000 ISO`:

- `B = 1,000,000`
- `S = 0` -> spot price about `1.00 USDC`
- `S = 1,000,000` -> spot price about `2.22 USDC`
- `S = 3,000,000` -> spot price about `4.92 USDC`
- `S = 5,000,000` -> spot price about `7.85 USDC`
- `S = 10,000,000` -> spot price about `15.76 USDC`

These numbers are not final launch supply. They illustrate the formula under one example `CurveSupplyCap`.

---

## 10. Curve Reserve Invariant

Curve Reserve is not treasury.

Curve Reserve is not protocol revenue.

Curve Reserve is not operational runway.

Curve Reserve exists to support redemptions through the bonding curve.

Rules:

- Base USDC paid for ISO mints goes to Curve Reserve.
- Curve Reserve pays redemptions.
- Curve Reserve must not be spent on salaries, grants, infrastructure, legal work, marketing, or operations.
- Only fees, premiums, SaaS contributions, grants, and donations can be treated as protocol revenue or treasury income.
- This invariant should be enforced at the smart contract architecture level, not only by policy.

---

## 11. Protocol-Owned Reference Liquidity and Arbitrage

ISO can trade on external venues such as DEXs and OTC markets. The protocol cannot and should not prevent external markets.

The bonding curve acts as an official mint/redeem venue and price reference.

When external price is above the bonding curve mint price plus fees, arbitrageurs may mint through the protocol and sell externally.

When external price is below the bonding curve redemption price minus fees, arbitrageurs may buy externally and redeem through the protocol.

The protocol earns fees only from operations performed through the bonding contract.

This mechanism is not a promise of profit to users.

---

## 12. Progressive Whale Premium / Governance Concentration Premium

Whale premium is not applied to normal ERC-20 transfers.

Whale premium is not fee-on-transfer.

Whale premium applies to primary ISO purchases through the bonding curve. Governance Concentration Premium may also apply during governance activation/staking when a verified identity attempts to activate a large amount of ISO for governance participation.

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

## 13. Fees and Treasury Distribution

Protocol revenue sources:

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

---

## 14. Ethereum Alignment Fund

The previous Liquidity / Market Stability Fund is renamed:

```text
Market Stability & Ethereum Alignment Fund
```

This fund is not part of the Curve Reserve.

This fund may hold ETH, USDC, or other governance-approved assets. It may receive ETH grants, ETH donations, or governance-approved ETH allocations.

ETH held by this fund does not create ETH redemption rights for ISO holders. ETH held by this fund must not be marketed as backing for ISO redemptions.

This fund may support Ethereum-native integrations, public-good modules, gas/infra experiments, builder grants, and ecosystem alignment.

---

## 15. ETH Grants and Donations

IsoniaOS may receive grants or donations in ETH.

ETH grants/donations should go to treasury funds, not Curve Reserve, unless governance and legal review explicitly approve otherwise.

Grant-funded work should be documented separately from ISO token sale economics.

Public-good components such as governance tooling, AI proposal validation, identity-aware voting, and treasury transparency should be positioned independently from speculative tokenomics.

---

## 16. Future ETH Payment Adapter

A future ETH Payment Adapter may allow users to pay ETH while the bonding curve still receives native USDC.

The adapter would swap ETH to USDC through an approved DEX route before minting ISO. ISO minting should only occur after the `BondingCurve` contract receives the required USDC amount.

This preserves the USDC Curve Reserve while improving Ethereum-native UX.

Required high-level flow:

```text
User pays ETH
-> ETH Payment Adapter
-> approved DEX swap ETH to USDC
-> BondingCurve receives USDC
-> ISO is minted
-> baseCost goes to Curve Reserve
-> fees/premiums go to TreasurySplitter
```

This feature requires separate specification, MEV/slippage analysis, security review, and governance approval. It must not be included in launch scope unless explicitly approved later.

Risks to document before implementation:

- slippage;
- MEV;
- DEX dependency;
- quote manipulation;
- failed swap handling;
- audit complexity;
- accounting complexity.

---

## 17. Future ETH-Denominated Reserve Research

ETH-denominated bonding curve may be researched in the future but is not part of the launch design.

If researched, it must clearly define whether ISO price is denominated in ETH or USD-equivalent ETH.

If denominated in ETH, ISO/USD price will move with ETH/USD.

If denominated in USD-equivalent ETH, oracle and overcollateralization problems must be solved.

No ETH-denominated reserve migration should be promised.

Any reserve asset change requires governance approval, independent legal review, security review, and updated disclosures.

---

## 18. Legal Boundary

ISO tokenomics must be documented conservatively.

Do not add:

- speculative APY numbers;
- exchange-listing language;
- claims about correlation with Bitcoin, ETH, or other assets;
- comparisons to specific tokens as investment examples;
- guaranteed return language;
- equity language;
- claims that future economic participation is active at launch.

Future value-accrual or economic participation mechanisms require independent legal review, governance approval, updated disclosures, and, where required, a regulated structure.
