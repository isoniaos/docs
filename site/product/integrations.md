# Integrations

IsoniaOS should connect existing governance tools before trying to replace them.

## Integration levels

### Link

IsoniaOS stores a URL or reference to an external record.

### Import

IsoniaOS fetches selected metadata from a source.

### Sync

IsoniaOS refreshes external state over time.

### Verify

IsoniaOS checks that external evidence matches expected governance data.

### Native

IsoniaOS directly participates in execution or proof creation.

## Initial source categories

Relevant external sources include:

- offchain voting systems;
- multisig and transaction systems;
- Governor-compatible governance portals;
- forums and discussion systems;
- GitHub repositories and pull requests;
- block explorers;
- attestations;
- grant and milestone tools.

## Boundary rules

Integrations must show source labels, last-sync data where available, stale/error states, and verification status.

A provider adapter must not silently turn linked context into governance authority.
