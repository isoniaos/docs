# IsoniaOS Roadmap

**Version:** Draft v0.2
**Project:** IsoniaOS
**Status:** Draft
**Primary market:** DAO and Web3 governance
**Language:** English

---

## Roadmap Philosophy

IsoniaOS should evolve from a focused governance lifecycle product into a protocol-backed governance architecture layer with transparent authority, identity-aware participation, accountable treasury policy, and legally cautious tokenomics.

The v0.2 roadmap is documentation-first. It freezes the intended ISO tokenomics and governance design before implementation work begins.

Core principles:

- keep contracts authoritative for on-chain state;
- keep AI advisory by default;
- keep the Curve Reserve separate from treasury;
- keep ISO as a standard ERC-20;
- keep launch settlement and redemption native USDC-only;
- treat future economic participation as conditional, legally reviewed, and governance-approved;
- avoid production, legal, audit, or compliance claims before the supporting work exists.

---

## Phase A - Design Freeze v0.2

Goal: establish a coherent public/internal design baseline.

Deliverables:

- ISO / Isonia naming.
- Bonding curve formula.
- Immutable curve parameters.
- USDC-only settlement.
- Reserve Asset Decision: USDC Curve Reserve, ETH Alignment Layer.
- Curve Reserve invariant.
- No fee-on-transfer decision.
- Governance threshold draft.
- Logarithmic voting with x10 cap draft.
- IdentityRegistry source-of-truth draft.
- Council design draft.
- People's Veto draft.
- No revenue-sharing at launch language.
- Legal fund and treasury fund split draft.
- Risk register and decision log.

Success criteria:

- All active docs consistently state native USDC-only launch bonding curve settlement and redemption.
- No active doc implies ISO represents equity, dividends, guaranteed returns, passive income, or revenue-sharing at launch.
- No active doc implies Curve Reserve can fund operations.
- ETH appears only as a non-reserve treasury/grant/donation asset, future payment adapter research item, or future reserve research topic.

---

## Phase B - Technical Specification

Goal: convert the v0.2 design into implementation-ready specs without writing production contracts prematurely.

Deliverables:

- `BondingCurve` spec.
- Curve Reserve spec.
- `TreasurySplitter` spec.
- `IdentityRegistry` spec.
- `GovernanceVault` spec.
- `CouncilRegistry` spec.
- People's Veto spec.
- AI validation spec.
- USDC impairment emergency clause.
- Market Stability & Ethereum Alignment Fund accounting rules.
- Future ETH Payment Adapter specification outline.

Non-goals:

- no mainnet deployment;
- no revenue-sharing module;
- no ETH-denominated reserve launch path;
- no fee-on-transfer token design.

---

## Phase C - Testnet MVP

Goal: validate mechanics with controlled testnet contracts, mocks, and simulations.

Deliverables:

- Standard ERC-20 ISO mock.
- USDC mock.
- Bonding curve simulation.
- Reserve accounting.
- Fee distribution simulation.
- Staking and cooldown simulation.
- Identity registry mock.
- Governance voting simulation.
- Whale premium and governance concentration premium simulation.
- USDC impairment pause/migration rehearsal.

Success criteria:

- The polynomial curve integral and reverse integral match across docs, simulation, and tests.
- Curve Reserve accounting cannot be mixed with fee treasury accounting in the simulation.
- Tokens bought externally cannot bypass governance cooldown in the model.

---

## Phase D - Governance MVP

Goal: make identity-aware governance participation concrete.

Deliverables:

- Verified account flow.
- Founding Member / governance credential concept.
- Council candidate profiles.
- Delegation.
- Public proposal lifecycle.
- AI proposal summaries.
- Public voting history.
- Council rationale history.
- People's Veto signaling.

Success criteria:

- Holding ISO is visibly different from active governance participation.
- Governance power depends on verified identity and activation/staking.
- Delegated voting power is shown separately from own identity power.

---

## Phase E - Treasury and Legal Fund

Goal: make fee routing and legal readiness auditable before any public token launch.

Deliverables:

- Fee fund accounting.
- Legal & Compliance Fund.
- Security & Audit Fund.
- Operations Reserve.
- Market Stability & Ethereum Alignment Fund.
- Initial legal provider selection process.
- Treasury reporting format.
- Curve Reserve isolation checks.

Draft fee split:

- 40% Protocol Treasury Fund.
- 20% Legal & Compliance Fund.
- 15% Security & Audit Fund.
- 15% Operations Reserve.
- 10% Market Stability & Ethereum Alignment Fund.

Success criteria:

- Curve Reserve is not presented as protocol revenue or operational runway.
- Treasury funds can receive fees, premiums, SaaS contributions, grants, and donations.
- ETH grants/donations are documented as treasury assets, not reserve backing.

---

## Phase F - Organization Setup

Goal: prepare the mature legal and operating structure when resources allow.

Deliverables:

- Association/foundation-like entity roadmap.
- Commercial Lda roadmap.
- IP assignment/licensing plan.
- Quarterly aggregated reporting.
- Commercial transparency and confidentiality policy.
- Legal fund executor procurement process.

Target structure:

1. Portuguese association / foundation-like entity for domains, GitHub organization, open-source IP, trademarks, governance constitution, public treasury coordination, grants, and Protocol Council process.
2. Separate commercial company, likely an Lda, for SaaS, enterprise deployments, custom integrations, support contracts, consulting, private deployments, SLA, payroll, and operational invoices.

Do not state these entities already exist unless later entity records confirm that they do.

---

## Phase G - Public Launch Readiness

Goal: make launch criteria explicit and conservative.

Deliverables:

- Legal sanity check.
- Smart contract audit.
- Public docs review.
- Security review.
- Emergency pause policy.
- USDC impairment migration procedure.
- Governance launch parameters.
- Token communications review.
- KYC/KYB/privacy flow review if identity verification is required at launch.
- Jurisdictional restrictions review.

Success criteria:

- Public docs do not promise revenue-sharing, yield, guaranteed returns, ETH backing, or appreciation.
- Launch reserve asset, payment asset, and redemption asset are native USDC only.
- USDC issuer/freeze/depeg risks are disclosed.

---

## Phase H - Future Value-Accrual Research

Goal: research legally compliant mechanisms without implying they are guaranteed or present at launch.

Possible research topics:

- buyback/burn;
- buyback-to-treasury;
- fee rebates;
- staking incentives;
- other value-accrual mechanisms;
- regulated economic participation structures where legally permitted.

Requirements:

- no revenue-sharing by default;
- legal review;
- independent legal opinion where appropriate;
- governance vote;
- updated disclosures;
- regulated module only if legally allowed.

No revenue-sharing rights exist at launch. Any future economic participation module will require a separate governance proposal, independent legal review, updated disclosures, and, where required, a regulated structure.

---

## Phase I - Future ETH Payment Adapter

Goal: improve Ethereum-native UX without changing the launch Curve Reserve asset.

Future high-level flow:

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
- The bonding curve still receives native USDC.
- ISO minting occurs only after `BondingCurve` receives the required USDC amount.
- Requires separate specification, MEV/slippage analysis, security review, accounting review, and governance approval.

Risks to resolve:

- slippage;
- MEV;
- DEX dependency;
- quote manipulation;
- failed swap handling;
- audit complexity;
- accounting complexity.

---

## Phase J - Future ETH-Denominated Reserve Research

Goal: leave room for research without promising a migration.

ETH-denominated bonding curve reserves may be researched in the future but are not part of the launch design.

If researched, the design must clearly define whether ISO price is denominated in ETH or USD-equivalent ETH. If denominated in ETH, ISO/USD price will move with ETH/USD. If denominated in USD-equivalent ETH, oracle and overcollateralization problems must be solved.

No ETH-denominated reserve migration should be promised. Any reserve asset change requires governance approval, independent legal review, security review, and updated disclosures.

---

## Current Documentation Set

- [Whitepaper](WHITEPAPER.md)
- [Tokenomics](TOKENOMICS.md)
- [Governance](GOVERNANCE.md)
- [Identity](IDENTITY.md)
- [Treasury](TREASURY.md)
- [Legal Roadmap](LEGAL_ROADMAP.md)
- [Risk Register](RISK_REGISTER.md)
- [Decision Log](DECISION_LOG.md)
- [Architecture](ARCHITECTURE.md)
