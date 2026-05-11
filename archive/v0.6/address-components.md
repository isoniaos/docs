# IsoniaOS v0.6 Address Components

## Purpose

Governance authority assignment depends heavily on addresses. App Core needs reusable, reliable, and readable address components for setup, proposals, diagnostics, and review screens.

The v0.6 address component set should replace raw textareas and repeated address formatting with shared primitives.

## Components

### AddressAvatar

Displays a deterministic identicon for an address.

Requirements:
- use DiceBear identicon style or an equivalent deterministic identicon generator;
- default size: 22px by 22px;
- default border radius: 2px;
- seed should be based on the normalized address when available;
- ENS names may be displayed as labels, but the avatar seed should prefer the resolved address if known.

### AddressDisplay

Displays a single address or ENS name.

Requirements:
- show avatar by default;
- show shortened address by default;
- use middle ellipsis character: …;
- example short format: 0x3C44…93BC;
- show full address in tooltip on hover/focus;
- if ENS name is displayed, tooltip should show resolved address when known;
- support copy-to-clipboard;
- support copied state;
- support invalid or unresolved state where relevant;
- use mono typography for address text.

Recommended props conceptually:
- value;
- ensName;
- resolvedAddress;
- shorten;
- showAvatar;
- showTooltip;
- copyable;
- validationState;
- size.

### AddressInput

Accepts a single address or ENS name.

Requirements:
- empty state;
- typing state;
- valid state;
- invalid state;
- checksum mismatch state;
- optional ENS resolving state;
- accept lowercase or uppercase valid hex addresses and normalize to checksum;
- reject mixed-case addresses with invalid checksum;
- show validation feedback without relying only on color;
- optionally show copy/save/confirm icon after valid input.

Recommended behavior:
- lowercase 0x address with valid length: normalize to checksum;
- uppercase 0x address with valid length: normalize to checksum;
- mixed-case address with correct checksum: valid;
- mixed-case address with incorrect checksum: invalid;
- invalid hex or invalid length: invalid.

### MultiAddressInput

Accepts one or many addresses and displays them as removable chips.

Preferred UX:
- chip/tag editor, not a plain textarea;
- supports raw paste of multiple addresses;
- turns valid pasted entries into chips;
- keeps invalid entries visible and correctable;
- allows removing one chip at a time;
- supports keyboard delete/backspace behavior;
- shows count and validation summary.

Supported separators:
- newline;
- comma;
- semicolon;
- space;
- tab.

Requirements:
- validate every item separately;
- deduplicate normalized addresses by default;
- allow min and max constraints;
- allow required mode;
- optionally allow ENS names;
- expose invalid, duplicate, and unresolved states;
- support paste from raw lists copied from docs, spreadsheets, wallets, or block explorers.

### AddressChip

Displays one parsed address item inside MultiAddressInput.

Requirements:
- avatar;
- shortened address or ENS name;
- tooltip with full address;
- remove button;
- invalid state;
- duplicate state if duplicates are not automatically removed;
- resolving state for ENS if implemented.

## ENS support

ENS support is optional for the first implementation.

If implemented:
- resolving must never block the entire form indefinitely;
- unresolved ENS should be shown as unresolved, not silently accepted as an address;
- resolved address should be stored separately from display label;
- transaction-building code must use the resolved address, not ENS text.

If not implemented in alpha.1:
- components may accept an ENS-looking string only as invalid or pending;
- docs should say ENS display support is future-ready but not yet resolved.

## Validation model

Suggested item state values:
- empty;
- typing;
- valid;
- invalid_format;
- invalid_checksum;
- duplicate;
- resolving;
- unresolved;
- zero_address;
- normalized.

Zero address handling:
- zero address should be invalid for authority holder fields;
- if any future field allows zero address, it must opt into that explicitly.

## Setup wizard usage

Use MultiAddressInput for:
- General Council holders;
- Treasury Committee holders;
- Security Council holders;
- Executor holder;
- any future role or mandate assignment list.

The component must support the user pasting multiple Hardhat accounts at once.

## Visual guidelines

Address avatar:
- size: 22px;
- border radius: 2px.

Address text:
- IBM Plex Mono;
- 16px in forms and review screens;
- 13px or 14px in dense tables;
- letter spacing: 0.004em.

States:
- neutral border for empty/default;
- success border for valid;
- danger border for invalid;
- warning state for unresolved/pending where appropriate.

## Non-goals for first implementation

- external explorer link;
- full ENS resolver if it expands scope too much;
- advanced contact book;
- address labels from external services;
- chain-specific identity registry.
