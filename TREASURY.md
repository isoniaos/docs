# IsoniaOS Treasury

**Version:** Draft v0.2
**Status:** Draft
**Project:** IsoniaOS
**Language:** English

---

## 1. Purpose

This document defines the draft v0.2 treasury architecture for IsoniaOS.

The most important rule is the separation between Curve Reserve and treasury funds.

---

## 2. Treasury Funds

IsoniaOS has two distinct categories:

1. Curve Reserve.
2. Protocol Treasury / Fee Treasury.

These must not be mixed in accounting, smart contract architecture, public communications, or governance proposals.

---

## 3. Curve Reserve

Curve Reserve receives `baseCost` from bonding curve mints.

Curve Reserve pays redemptions.

Curve Reserve is not spendable for operations.

Curve Reserve is not:

- treasury;
- protocol revenue;
- operational runway;
- a salary fund;
- a grant fund;
- a legal fund;
- a marketing fund;
- an infrastructure budget.

Curve Reserve exists to support redemptions through the bonding curve. It must not be spent on salaries, grants, infrastructure, legal work, marketing, or operations.

This invariant should be enforced at the smart contract architecture level, not only by policy.

---

## 4. Protocol Revenue Sources

Protocol revenue sources may include:

- buy fees;
- sell fees;
- progressive whale premiums;
- governance activation premiums;
- SaaS contributions;
- grants;
- donations.

Only these sources can be treated as protocol revenue or treasury income.

Fees and premiums are separate from Curve Reserve.

---

## 5. Draft Fee Distribution

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

## 6. Legal & Compliance Fund

The Legal & Compliance Fund exists to finance:

- legal reviews;
- governance structuring;
- regulatory analysis;
- entity setup;
- token classification work;
- privacy documentation;
- future value-accrual feasibility.

Specialists should be engaged as early as practically possible after the fund receives sufficient resources.

Future revenue-sharing or economic participation mechanisms require independent legal review before activation.

Legal service providers or executors should be approved through governance or Council-supervised procurement.

No revenue-sharing rights exist at launch. Any future economic participation module will require a separate governance proposal, independent legal review, updated disclosures, and, where required, a regulated structure.

---

## 7. Security & Audit Fund

The Security & Audit Fund should finance:

- smart contract audits;
- independent security reviews;
- formal verification or math review where appropriate;
- bug bounty programs;
- incident response support;
- emergency technical review;
- security tooling.

This fund is protocol revenue. It is not Curve Reserve.

---

## 8. Operations Reserve

Operations Reserve should finance operational expenses that are not appropriate for Curve Reserve:

- infrastructure;
- hosting;
- monitoring;
- development operations;
- documentation operations;
- administrative services;
- public communication operations.

Operations Reserve should not be marketed as funded by redemption reserve assets.

---

## 9. Market Stability & Ethereum Alignment Fund

The previous Liquidity / Market Stability Fund is renamed:

```text
Market Stability & Ethereum Alignment Fund
```

This fund is not part of the Curve Reserve.

This fund may hold ETH, USDC, or other governance-approved assets.

This fund may receive:

- ETH grants;
- ETH donations;
- governance-approved ETH allocations;
- non-reserve USDC allocations;
- other governance-approved assets.

ETH held by this fund does not create ETH redemption rights for ISO holders.

ETH held by this fund must not be marketed as backing for ISO redemptions.

This fund may support:

- Ethereum-native integrations;
- public-good modules;
- gas/infra experiments;
- builder grants;
- ecosystem alignment;
- non-reserve liquidity or market stability programs approved by governance.

---

## 10. ETH Grants and Donations

IsoniaOS may receive grants or donations in ETH.

ETH grants/donations should go to treasury funds, not Curve Reserve, unless governance and legal review explicitly approve otherwise.

Grant-funded work should be documented separately from ISO token sale economics.

Public-good components such as governance tooling, AI proposal validation, identity-aware voting, and treasury transparency should be positioned independently from speculative tokenomics.

---

## 11. Reserve Asset Decision: USDC Curve Reserve, ETH Alignment Layer

Launch bonding curve remains denominated in native USDC.

Launch Curve Reserve remains native USDC-only.

ETH is not the launch redemption asset.

ETH is not the launch unit of account for ISO bonding curve.

The decision is based on redemption predictability, accounting clarity, legal fund stability, and simpler smart contract security.

USDC has issuer, blacklisting, depeg, and regulatory risks. ETH has stronger decentralization properties, but introduces reserve volatility and accounting uncertainty.

Reserve volatility should not be used as a substitute for product value, governance credibility, or protocol adoption.

```text
Reserve should be boring. Token upside should come from adoption, utility, governance demand and legally compliant future value-accrual mechanisms, not from unnecessary reserve volatility.
```

---

## 12. USDC Risk Acknowledgement

USDC carries centralized issuer risk.

USDC may be subject to blacklisting, freezing, regulatory, or operational constraints.

This risk must be included in the Risk Register.

The protocol should include a USDC impairment emergency clause. The emergency clause should allow governance to pause new mint/redeem operations and begin a legally compliant migration procedure if USDC becomes materially impaired, frozen, unavailable, depegged, or legally unsuitable.

Do not imply that migration can recover funds if the Curve Reserve address itself becomes frozen. Blacklisting of the reserve address could be an existential operational risk.

---

## 13. Commercial Transparency and Confidentiality

IsoniaOS should balance public accountability with client confidentiality.

Commercial clients may not want their identity, exact contract terms, or exact payment amounts disclosed.

The commercial entity should publish periodic aggregated reports. Reports should avoid deanonymizing clients.

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

---

## 14. Reporting Requirements

Treasury reporting should distinguish:

- Curve Reserve balance;
- protocol revenue by source;
- fee fund allocations;
- Legal & Compliance Fund balance and commitments;
- Security & Audit Fund balance and commitments;
- Operations Reserve balance and runway;
- Market Stability & Ethereum Alignment Fund assets;
- ETH treasury assets that are not reserve backing;
- grants and donations separate from ISO sale economics.

Reports must not imply that ETH backs ISO redemptions at launch.

---

## 15. Open Questions

- Exact buy fee and sell fee parameters.
- Initial treasury multisig or governance-controlled contract structure.
- Whether any fee split bounds are hard-coded or constitutionally bounded.
- Reporting cadence before public launch.
- Legal fund executor selection process.
- Treatment of slashed Council bond funds in accounting systems.
