# IsoniaOS Decision Log

**Version:** Draft v0.2
**Status:** Draft
**Project:** IsoniaOS
**Language:** English

---

## 1. Purpose

This log records product/context decisions and draft v0.2 design decisions for ISO tokenomics, governance, treasury, legal phasing, reserve assets, and ETH alignment.

These are design decisions, not deployed implementation.

---

## 2. Decisions

| Decision | Draft v0.2 outcome | Rationale / notes |
| --- | --- | --- |
| Product hierarchy | IsoniaOS is product-first | IsoniaOS is a governance control plane for accountable digital organizations, not primarily a token project. |
| First market | DAO/Web3 governance | The first market remains DAOs, protocols, foundations, grants programs, and onchain communities. |
| Active product baseline | v0.8 accountability and integration preview | v0.8 remains the active product implementation/accountability baseline. |
| ISO layer position | Supporting funding and protocol self-governance layer integrated into public beta planning where relevant | ISO tokenomics supports IsoniaOS funding and self-governance; it does not replace the product roadmap, and token launch remains a separate explicit decision. |
| Main whitepaper and roadmap | Product-first | `WHITEPAPER.md` and `ROADMAP.md` should explain the governance control plane before tokenomics. |
| Product architecture | Product-first `ARCHITECTURE.md` | The main architecture doc covers product lifecycle, integrations, accountability, memory, and AI advisory architecture. |
| ISO architecture | Separate `ISO_ARCHITECTURE.md` | Token issuance, reserve, treasury, and ISO governance flows are separated from main product architecture. |
| ISO economics source of truth | `TOKENOMICS.md` | Detailed bonding curve, reserve, fees, premiums, and economic constraints belong in `TOKENOMICS.md`. |
| Token name | Isonia | Public token name for the planned IsoniaOS token. |
| Token symbol | ISO | Intended symbol. No claim that ISO is globally unique as a ticker. |
| Payment asset | Native USDC only | Simpler accounting, redemption predictability, legal fund stability, and lower launch complexity. |
| Launch Curve Reserve | Native USDC-only | Base mint cost goes to Curve Reserve and redemptions are paid from Curve Reserve. |
| ETH launch redemption asset | ETH is not the launch redemption asset | ETH may be used for grants/donations/non-reserve treasury allocation, not launch redemptions. |
| ETH launch unit of account | ETH is not the launch unit of account for ISO bonding curve | Launch bonding curve remains denominated in native USDC. |
| Bonding curve type | Polynomial | Formula: `P(S) = P0 * (1 + S / B)^k`. |
| P0 | `1 USDC` | Initial spot mint reference price. |
| k | `1.15` | Polynomial curve exponent. |
| B | `CurveSupplyCap / 10` | Scale parameter derived from curve supply cap. |
| Core curve parameters | Immutable after public launch | `P0`, `k`, `B`, `CurveSupplyCap`, and core integral formula are immutable after public launch. |
| ERC-20 design | Standard ERC-20 | Keep compatibility with wallets, DEXs, indexers, accounting systems, and bridges. |
| Fee-on-transfer | No fee-on-transfer | Fees/premiums belong in bonding/governance modules, not token transfers. |
| Transfer tax | No transfer tax | Avoid breaking ERC-20 expectations and integrations. |
| Revenue-sharing rights at launch | No revenue-sharing rights at launch | Future economic participation requires governance proposal, independent legal review, updated disclosures, and regulated structure where required. |
| Curve Reserve status | Curve Reserve is not treasury | Curve Reserve supports redemptions and must not fund operations. |
| Fees and premiums | Fund treasury funds | Buy/sell fees, whale premiums, activation premiums, SaaS contributions, grants, and donations can fund treasury. |
| Market Stability & Ethereum Alignment Fund | Added | Replaces/renames Liquidity / Market Stability Fund and supports non-reserve ETH alignment. |
| ETH grants/donations | Allowed as non-reserve treasury assets | ETH grants/donations should go to treasury funds, not Curve Reserve, unless future governance and legal review approve otherwise. |
| Future ETH Payment Adapter | Added to roadmap, not launch scope | Adapter may swap ETH to USDC before minting ISO; requires specification, MEV/slippage analysis, audit, and governance approval. |
| Future ETH-denominated reserve research | Allowed, not promised | Any reserve asset change requires governance approval, independent legal review, security review, and updated disclosures. |
| Identity-aware governance | Adopted as draft | Governance power requires verified identity and activation/staking. |
| Identity source of truth | Single `IdentityRegistry` | Governance modules query registry; token transfer logic remains identity-free. |
| Verifier adapters | Modular adapters | New adapters can be added through governance, timelock, and potential Council oversight. |
| Governance cooldown | Adopted as draft | 0-7 days: 0%; 8-30 days: 25%; 31-90 days: 50%; 91-180 days: 75%; 180+ days: 100%. |
| Voting threshold | Hybrid threshold | `VotingEligibilityThreshold = max(100 ISO, 0.0001% of GovernanceReferenceSupply)`. |
| Proposal threshold | Hybrid threshold plus identity support path | `ProposalCreationThreshold = max(1,000 ISO, 0.001% of GovernanceReferenceSupply)` or sufficient verified identity support, draft 50 identities. |
| Voting power curve | Logarithmic with x10 cap | One verified identity cannot exceed 10 own voice units. |
| CapStake draft | `0.1% of GovernanceReferenceSupply` | Used in logarithmic voice power formula. |
| Protocol Council | IsoniaOS Protocol Council | Public docs avoid Board of Directors language to prevent confusion with corporate shareholder rights. |
| Council seats | 11 seats | Draft Council size. |
| Council bond | Draft Phase 1: 1,000 ISO | Mature target may increase by governance, for example toward 5,000 ISO. |
| Council slashing | Objective violations only | Not for political opinions. |
| People's Veto | Adopted as draft | Soft and Hard People's Veto for public-trust signals and critical decisions. |
| Constitution | Required | Defines governance power limits, treasury rules, Council obligations, and economic module activation requirements. |
| AI proposal validation | Advisory only | AI summarizes, flags risks, and assists interpretation; it is not ultimate authority. |
| Two-entity structure roadmap | Adopted as roadmap | Association/foundation-like entity plus separate commercial Lda when funded. |
| Phased non-profit governance transfer | Adopted as roadmap | Council role grows from advisory to formally recognized governance body across phases. |

---

## 3. Required Legal Phrase

No revenue-sharing rights exist at launch. Any future economic participation module will require a separate governance proposal, independent legal review, updated disclosures, and, where required, a regulated structure.

---

## 4. Open Decisions

- Final `CurveSupplyCap`.
- Exact buy fee and sell fee.
- Exact governance concentration premium implementation details.
- Exact `GovernanceReferenceSupply`.
- Final identity type enum.
- Final Council election term length.
- Final People's Veto quorum.
- Final legal entity timing.
- Final jurisdictional restrictions.
- Whether future value-accrual mechanisms are legally feasible.
