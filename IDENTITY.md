# IsoniaOS Identity

**Version:** Draft v0.2
**Status:** Draft
**Project:** IsoniaOS
**Language:** English

---

## 1. Purpose

IsoniaOS governance is based on verified identity, not only wallet balances.

The identity layer is designed to reduce Sybil attacks, support identity-aware governance thresholds, enable Council elections, and preserve ERC-20 compatibility by keeping identity checks out of token transfer logic.

---

## 2. Identity Registry

IsoniaOS governance relies on a single `IdentityRegistry` as the source of truth for verified participants.

Rules:

- The ERC-20 token itself does not perform identity checks.
- `GovernanceVault`, `BondingCurve`, `CouncilRegistry`, and other governance modules may query `IdentityRegistry`.
- `IdentityRegistry` should expose a stable minimal interface.
- Governance logic is based on verified identity, not individual wallet address.

Example interface:

```solidity
interface IIdentityRegistry {
    function identityOf(address wallet) external view returns (bytes32);
    function isVerified(bytes32 identityId) external view returns (bool);
    function identityType(bytes32 identityId) external view returns (uint8);
    function expiresAt(bytes32 identityId) external view returns (uint256);
}
```

---

## 3. On-Chain Data Minimization

No personal data should be stored on-chain.

The registry should store only:

- identity status;
- identity hash/id;
- identity type;
- expiry;
- revocation state;
- wallet-to-identity mapping.

Identity may represent a verified human or verified legal entity. Multiple wallets may map to one identity.

Sensitive KYC/KYB material, documents, biometrics, addresses, and private attestations should remain off-chain with the relevant provider or legally approved storage process.

---

## 4. Identity Types

Draft identity types may include:

- verified human;
- verified legal entity;
- Council-reviewed participant;
- governance service provider;
- commercial client representative;
- restricted or expired identity state.

The exact `identityType` enum should be defined in a future technical specification.

---

## 5. Verifier Adapters

`IdentityRegistry` should support modular verifier adapters.

New adapters can be added through governance.

Examples:

- KYC provider adapter;
- KYB provider adapter;
- EAS adapter;
- Privado ID adapter;
- World ID adapter;
- Proof of Humanity adapter;
- manual Council review adapter.

Adding or removing adapters should require governance approval, timelock, and potentially Council oversight.

The registry remains the single source of truth, while adapters only provide verification inputs.

---

## 6. Governance Use

Identity is used by governance modules for:

- voting eligibility;
- proposal creation eligibility;
- Council election participation;
- Council candidate verification;
- own identity power cap;
- delegated voting power display;
- People's Veto thresholds;
- Sybil-resistant quorum;
- governance concentration premium.

The token contract remains identity-agnostic.

---

## 7. Bonding Curve Use

`BondingCurve` may query `IdentityRegistry` when:

- identity verification is required for primary purchase;
- whale premium thresholds apply by verified identity;
- jurisdictional restrictions or compliance controls are legally required;
- governance activation premiums need identity-aware accounting.

The ERC-20 transfer path must remain free of identity checks.

---

## 8. Expiry and Revocation

Identity records should support expiry and revocation.

Governance behavior for expired or revoked identities must be specified before launch. At minimum:

- expired identity should not receive new governance power;
- revoked identity should not be able to participate in governance;
- existing stake lots may require special handling;
- appeal or correction process should be defined where legally appropriate.

---

## 9. Privacy and Legal Review

Identity verification can create privacy, data protection, discrimination, and jurisdictional risks.

Before launch, IsoniaOS should complete:

- privacy documentation;
- provider due diligence;
- data minimization review;
- jurisdictional restrictions review;
- user terms review;
- retention and deletion policy review;
- incident response plan for identity provider failure or data breach.

---

## 10. Open Questions

- Final identity type enum.
- Required identity level for primary ISO purchase.
- Required identity level for governance activation.
- Council role in manual verification appeals.
- Expiry grace period.
- Treatment of delegated power when identity expires.
- Whether legal entities and humans share voting thresholds or use distinct caps.
