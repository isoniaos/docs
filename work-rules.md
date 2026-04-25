# IsoniaOS — Engineering Work Rules

## 1. Общие правила
- сначала спецификация, потом код
- никакой скрытой бизнес-логики в UI
- никакой критической авторизации off-chain
- любые архитектурные отклонения оформлять ADR

## 2. Solidity
- использовать custom errors
- emit events на все критические переходы
- без proxy upgradeability в v0.1
- execution для v0.1 только через безопасный demo target / whitelist

## 3. TypeScript / Control Plane
- strict mode
- идемпотентность обязательна
- projections должны быть replay-safe
- raw event store обязателен
- finality distinction обязательна

## 4. Frontend
- domain logic отдельно от theme layer
- theme replaceable
- self-hosted и SaaS через config/extensions, не через два разных ядра

## 5. Dependencies
- минимизировать npm surface
- предпочитать first-party utilities
- избегать сомнительных transitive-heavy библиотек

## 6. Git / PR rules
- small scoped changes
- commit message должен отражать bounded context
- запрещены unrelated changes в одном PR

