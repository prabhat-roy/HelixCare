# fhir-gateway

HL7 FHIR R4 REST facade. Translates internal gRPC to FHIR Bundle.
Enforces consent at consumer boundary, writes audit-trail before every PHI read.

Domain: platform · Lang: Go · Port: 50005

## Compliance
- HIPAA §164.312(b) — every read writes audit-trail first
- OPA `phi-access.rego` — consumer-boundary policy gate
- OPA `region-residency.rego` — refuses cross-region resource reads
