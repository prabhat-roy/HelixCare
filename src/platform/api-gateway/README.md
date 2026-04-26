# api-gateway

FHIR-aware HTTP+gRPC ingress for HelixCare. Handles OAuth2/SMART-on-FHIR token
validation, mTLS termination, rate limiting, and request fan-out to BFFs.

| Property | Value |
|---|---|
| Domain  | platform |
| Lang    | Go |
| Port    | 50000 |
| Health  | `/healthz` |

PHI rule: never log MRN, DOB, national-id, or clinical detail.
