# Grafana dashboards (provisioned)

- platform-overview.json   - SLOs across BFFs and gateways
- fhir-gateway.json        - FHIR validation success/failure, p95 latency
- ehr-core.json            - read/write QPS, audit-log lag
- pharmacy-blue-green.json - prescription/dispensing rollout health
- telehealth-latency.json  - signalling p50/p95/p99, sub-200ms SLO panel
- ml-models.json           - readmission/risk/clinical-NLP serving health
- compliance-audit.json    - audit-write throughput, Cassandra retention monitor
- phi-residency.json       - Cilium drop_count by (src_region, dst_region)
