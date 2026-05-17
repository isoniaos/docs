# IsoniaOS Risk Register

**Version:** Draft v0.2
**Status:** Draft
**Project:** IsoniaOS
**Language:** English

---

## 1. Purpose

This register tracks material risks in the draft v0.2 ISO tokenomics, governance, treasury, identity, legal, and ETH alignment design.

It is not exhaustive and does not replace legal, security, financial, or operational review.

---

## 2. Risk Register

| Risk | Description | Mitigation | Documentation requirement | Owner / responsible body |
| --- | --- | --- | --- | --- |
| Securities / financial instrument classification risk | ISO or related sale, governance, or future value-accrual mechanisms may be classified as securities or other regulated financial instruments in some jurisdictions. | Avoid equity, dividend, yield, guaranteed return, and launch revenue-sharing language. Obtain independent legal review before launch and before future economic modules. | Public docs must say no revenue-sharing rights exist at launch and future economic participation requires legal review, governance approval, and updated disclosures. | Legal & Compliance Fund; Protocol Council; future entity counsel |
| Regulatory risk in EU and other jurisdictions | Token sale, identity checks, stablecoin use, treasury reporting, or governance participation may trigger regulatory obligations. | Maintain legal roadmap, jurisdictional review, disclosures, KYC/KYB/privacy analysis, and launch restrictions where needed. | Legal roadmap must remain current before launch communications. | Legal & Compliance Fund; Protocol Council |
| Stablecoin risk / USDC impairment | Launch Curve Reserve relies on native USDC, which can become impaired, unavailable, depegged, frozen, or legally unsuitable. | USDC impairment emergency clause, monitoring, governance pause, and migration process. | Tokenomics, Treasury, and Architecture must describe native USDC-only launch reserve and emergency clause. | Protocol Council; Security & Audit Fund; Legal & Compliance Fund |
| USDC blacklisting/freeze risk | The Curve Reserve may rely on native USDC, which has centralized issuer and blacklisting risk. | Use only compliant flows, document risk, include emergency clause, avoid illicit flows, monitor issuer/regulatory conditions. | Docs must state the honest limitation: if the reserve address is frozen, governance migration may not be able to recover frozen USDC. | Protocol Council; Legal & Compliance Fund |
| USDC depeg risk | USDC may temporarily or permanently trade below its intended value. | Emergency pause policy, monitoring, governance migration process, conservative treasury management. | Risk disclosure and emergency process must be visible before launch. | Protocol Council; Treasury operators |
| Curve Reserve misuse risk | Governance, operators, or treasury managers may attempt to use Curve Reserve for operations. | Enforce reserve separation at smart contract architecture level and in constitution. | Docs must state Curve Reserve is not treasury, protocol revenue, or operational runway. | Protocol Council; Security & Audit Fund |
| Smart contract bug risk | Bonding curve, reserve, vault, identity, treasury, or governance contracts may contain bugs. | Independent audits, testnet MVP, formal math review where needed, bug bounty, staged launch. | Launch readiness docs must include audit and security review status. | Security & Audit Fund |
| Bonding curve math implementation risk | Integral pricing, reverse integral, rounding, precision, or cap accounting may be implemented incorrectly. | Independent math review, invariant tests, simulation, fixed-point analysis, fuzzing. | Formula must be consistent across Whitepaper, Tokenomics, and Architecture. | Security & Audit Fund; protocol engineering |
| OTC / external market manipulation risk | External ISO markets may diverge from bonding curve reference price or be manipulated. | Clear disclosures, no profit promises, monitor external markets, bonding curve as official mint/redeem reference. | Docs must say external arbitrage is not a promise of profit. | Protocol Council; Market Stability & Ethereum Alignment Fund |
| Governance capture risk | Large holders or coordinated actors may capture governance. | Identity verification, cooldown, logarithmic x10 cap, governance concentration premium, Council review, People's Veto. | Governance docs must show thresholds, cooldown, and cap. | Protocol Council; governance participants |
| Sybil attack risk | Attackers may create many wallets or identities to manipulate identity-based thresholds. | Single IdentityRegistry, verifier adapters, expiry/revocation, provider review, People's Veto quorum design. | Identity docs must state governance is based on verified identity, not wallet address. | Protocol Council; IdentityRegistry governance |
| Identity provider failure risk | KYC/KYB or identity providers may fail, change policy, lose data, or become unavailable. | Modular adapters, multiple approved providers, manual Council review adapter, expiry/revocation process. | Identity docs must disclose adapter model and no on-chain personal data. | Protocol Council; Legal & Compliance Fund |
| Council capture risk | Council seats may be captured by coordinated candidates, bribery, or delegation concentration. | Public profiles, delegation transparency, Council bonds, slashing for objective violations, People's Veto, elections by verified participants. | Governance docs must publish Council profile fields, delegated voting power, and conflicts. | Governance participants; Protocol Council |
| Council inactivity risk | Council members may miss votes or fail to respond to critical events. | Attendance tracking, missed vote records, objective slashing, replacement process. | Governance docs must include missed votes and inactivity as objective slashing grounds. | Protocol Council; governance participants |
| Client confidentiality leakage risk | Public accountability reporting may reveal client identity, private contract terms, exact invoices, or sensitive technical details. | Aggregated quarterly reporting, client concentration ranges, confidentiality policy. | Legal/Treasury docs must state individual client names and exact terms are private unless permitted. | Commercial entity; Protocol Council oversight |
| Treasury misallocation risk | Fee funds may be spent outside their intended purpose or constitutional bounds. | TreasurySplitter, fund accounting, governance approvals, Council oversight, public reports. | Treasury docs must distinguish funds and reporting requirements. | Protocol Council; treasury operators |
| Revenue-sharing communication risk | Public materials may imply revenue-sharing exists at launch or is guaranteed later. | Required legal phrase, communication review, legal review before future modules. | Docs must include exact no-revenue-sharing launch language. | Legal & Compliance Fund; communications owners |
| Legal fund underfunding risk | Legal work may be delayed if the Legal & Compliance Fund lacks resources. | Allocate 20% draft fee split to legal fund, engage counsel as early as practical, prioritize risk-minimizing docs. | Legal roadmap must sequence review work by funding availability. | Legal & Compliance Fund; Protocol Council |
| Public misunderstanding of ISO as guaranteed yield | Users may misunderstand bonding curve, fees, or treasury assets as guaranteed profit or passive income. | Conservative language, no APY, no guaranteed returns, explicit risk register, disclaimers. | Tokenomics and Whitepaper must avoid promotional appreciation/yield claims. | Communications owners; Legal & Compliance Fund |
| ETH reserve volatility risk | If ETH were used as Curve Reserve, ISO/USD redemption value would fluctuate with ETH/USD. | Do not use ETH as launch Curve Reserve. Keep ETH in non-reserve treasury funds only unless future governance/legal/security review approves otherwise. | Docs must state ETH is not the launch redemption asset or unit of account. | Protocol Council; Legal & Compliance Fund |
| ETH Payment Adapter risk | Future ETH-to-USDC payment adapter may introduce slippage, MEV, DEX and quote risks. | Not launch scope. Requires independent specification, audit, accounting review, and governance approval. | Roadmap and Tokenomics must place ETH Payment Adapter in future research/implementation scope. | Security & Audit Fund; Protocol Council |
| DEX dependency risk | A future ETH Payment Adapter would depend on DEX liquidity and route reliability. | Approved DEX routes, slippage controls, failed swap handling, monitoring, audit. | Adapter specification must define route approval and failure states. | Security & Audit Fund |
| Quote manipulation risk | A future adapter may be manipulated through bad quotes or stale prices. | Quote validation, slippage bounds, oracle/route review if needed, MEV analysis. | Adapter specification must document quote security. | Security & Audit Fund |
| Audit complexity risk | Adding payment adapters, identity checks, or treasury splitters increases audit scope. | Keep launch scope small; add modules only after specs and reviews. | Roadmap must keep adapter and future ETH reserve research out of launch scope. | Security & Audit Fund |
| Accounting complexity risk | Multiple funds, assets, grants, and donations may confuse reserve versus treasury accounting. | Separate reports, fund labels, reserve invariant, accounting review. | Treasury docs must separate Curve Reserve assets from treasury fund assets. | Treasury operators; Protocol Council |

---

## 3. Review Cadence

The Risk Register should be reviewed:

- before public launch communications;
- before testnet MVP deployment;
- before any mainnet launch;
- before any future value-accrual proposal;
- before any reserve asset migration proposal;
- after material legal, regulatory, stablecoin, or security events.
