# Diagnostics

Diagnostics help operators and users understand where a problem occurred.

## Diagnostic layers

IsoniaOS diagnostics should distinguish:

- chain state;
- contract state;
- wallet state;
- indexer state;
- projection state;
- API state;
- runtime configuration;
- external provider state;
- App Core rendering state.

## Why distinction matters

A transaction can be mined while the indexer is stale.

An external provider can fail while contract state is healthy.

An App Core view can be misconfigured while Control Plane APIs are available.

Diagnostics should keep these cases separate so operators do not confuse read-model lag, provider failure, and governance execution failure.

## Public posture

Where state is stale, missing, unsupported, or unknown, public pages should say so. Unknown should not silently become success.
