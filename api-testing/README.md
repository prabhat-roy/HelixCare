# API testing for HelixCare
- `pact/` — consumer-driven contract test (api-gateway → identity-service) + provider verifier script
- `hurl/` — version-controlled HTTP test flows (health, auth) + runner
- `spectral/` — custom OpenAPI ruleset (kebab-case paths, mandatory 4xx schemas) + runner
