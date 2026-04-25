# HelixCare — Enterprise Healthcare Management Platform

Enterprise-grade, cloud-native healthcare platform built on open source technologies. Covers the
full patient lifecycle — appointment booking, clinical workflows, diagnostics, pharmacy, billing,
and insurance — across hospital networks, clinics, and telehealth. HIPAA and HL7 FHIR R4 compliant.

---

## Overview

| Attribute         | Value                                                        |
|-------------------|--------------------------------------------------------------|
| Type              | Integrated Hospital Information & Telehealth System          |
| Domains           | 16 business domains                                          |
| Services          | 190+ microservices                                           |
| Languages         | Go, Java, Kotlin, Python, Node.js, Rust, TypeScript          |
| Standards         | HL7 FHIR R4, DICOM, ICD-10, SNOMED CT, HL7 v2               |
| Compliance        | HIPAA, GDPR, ISO 27001                                       |
| Databases         | PostgreSQL, MongoDB, Redis, Cassandra, Elasticsearch, TimescaleDB |
| Message Broker    | Apache Kafka, RabbitMQ, NATS JetStream                       |
| Cloud             | AWS (primary), Azure                                         |
| Orchestration     | Kubernetes (EKS / AKS)                                       |
| Frontend          | React (patient portal), Angular (clinician dashboard), React Native (mobile app) |

---

## Business Domains

| # | Domain                | Key Services                                                         |
|---|-----------------------|----------------------------------------------------------------------|
| 1 | Patient Management    | patient-registration, patient-profile, medical-history, demographics |
| 2 | Appointment & Scheduling | appointment-service, slot-management, waitlist, reminder-service  |
| 3 | Clinical Workflows    | encounter-service, clinical-notes, care-plan, order-management       |
| 4 | Diagnostics           | lab-order-service, radiology-service, pathology, dicom-viewer        |
| 5 | Pharmacy              | prescription-service, drug-inventory, drug-interaction, dispensing   |
| 6 | Telehealth            | video-consultation, telechat, remote-monitoring, e-prescription      |
| 7 | Billing & Finance     | billing-service, invoice-service, payment-service, co-pay, refund    |
| 8 | Insurance & Claims    | eligibility-service, pre-auth-service, claim-submission, adjudication|
| 9 | Electronic Health Record | ehr-service, fhir-gateway, document-service, audit-trail          |
| 10 | Bed & Ward Management | bed-service, ward-service, icu-management, discharge-planning        |
| 11 | Staff & HR            | staff-service, shift-management, duty-roster, credentialing          |
| 12 | Inventory & Supply    | medical-supply-service, equipment-service, purchase-order, vendor    |
| 13 | Communications        | notification-orchestrator, sms, email, push, in-app-alert            |
| 14 | Analytics & AI        | population-health, risk-stratification, readmission-predictor, nlp-service |
| 15 | Identity & Access     | auth-service, user-service, rbac-service, mfa, sso-service           |
| 16 | Compliance & Audit    | consent-service, data-retention, hipaa-audit, gdpr-service           |

---

## Architecture

```
                ┌────────────────────────────────────────────┐
                │              API Gateway                    │
                │   (OAuth2 · mTLS · Rate Limit · WAF)        │
                └──────┬─────────────┬───────────────┬────────┘
                       │             │               │
              ┌────────▼───┐  ┌──────▼──────┐  ┌────▼──────────┐
              │ Patient BFF│  │Clinician BFF│  │  Admin BFF    │
              │  (React)   │  │  (Angular)  │  │  (React)      │
              └────────┬───┘  └──────┬──────┘  └────┬──────────┘
                       │             │               │
        ┌──────────────▼─────────────▼───────────────▼──────────────┐
        │               Internal gRPC Mesh (Istio mTLS)              │
        │  ┌──────────┐  ┌────────────┐  ┌──────────┐  ┌─────────┐  │
        │  │ Clinical │  │ Diagnostics│  │ Pharmacy │  │ Billing │  │
        │  │ Services │  │  Services  │  │ Services │  │ Services│  │
        │  └──────────┘  └────────────┘  └──────────┘  └─────────┘  │
        └──────────────────────┬─────────────────────────────────────┘
                               │ Kafka Events (PHI encrypted at rest)
                     ┌─────────▼──────────┐
                     │    FHIR Gateway     │
                     │  (HL7 FHIR R4 API) │
                     └─────────┬──────────┘
                               │
           ┌───────────────────▼──────────────────────┐
           │           Clinical Analytics             │
           │  ClickHouse · Spark · Airflow · MLflow   │
           └──────────────────────────────────────────┘
```

---

## Tech Stack

### Healthcare Standards & Interoperability
- **FHIR R4**: All clinical data exposed via HL7 FHIR R4 REST API (HAPI FHIR server)
- **DICOM**: Medical imaging stored in Orthanc DICOM server; viewer via OHIF
- **HL7 v2**: Legacy hospital integration via Mirth Connect (HL7 v2 ↔ FHIR adapter)
- **SNOMED CT / ICD-10**: Terminology service backed by Snowstorm
- **CDA / CCDA**: Clinical document exchange for referrals and transitions of care

### Infrastructure
- **Kubernetes**: EKS (primary) + AKS — multi-AZ, dedicated node pools per domain
- **Service Mesh**: Istio (mTLS mandatory — PHI never travels unencrypted in-cluster)
- **Database Encryption**: PostgreSQL with TDE; MongoDB encrypted at rest (AES-256)
- **Audit Logging**: Immutable audit trail via Apache Kafka → Elasticsearch (tamper-evident)
- **Backup**: Velero (K8s state) + automated daily PostgreSQL dumps to encrypted S3

### CI/CD & GitOps
- **CI**: Jenkins (primary), GitHub Actions, GitLab CI
- **CD**: ArgoCD (App-of-Apps), Argo Rollouts (blue-green for clinical services — zero downtime mandatory)
- **IaC**: Terraform (EKS/AKS), Ansible (node hardening to CIS benchmarks)
- **Secrets**: HashiCorp Vault with auto-rotation; External Secrets Operator

### Observability
- **Metrics**: Prometheus + Thanos + Grafana (dedicated SLO dashboards per domain)
- **Logs**: Loki + Fluent Bit (PHI fields masked at collection via Fluent Bit Lua filters)
- **Traces**: Jaeger + OpenTelemetry (trace every clinical transaction end-to-end)
- **Uptime**: 99.99% SLA for critical paths (appointment booking, prescription, emergency)
- **On-call**: Grafana OnCall + PagerDuty escalation for P1 clinical system outages

### Security (HIPAA-aligned)
- **Identity**: Keycloak (patient/staff SSO with SMART on FHIR), MFA enforced for all clinical staff
- **Secrets**: HashiCorp Vault + AWS KMS (PHI encryption keys)
- **Network**: Cilium eBPF (zero-trust L3/L4), Istio mTLS (L7), no lateral movement between domains
- **Scanning**: Trivy, Semgrep (HIPAA-specific rules), OWASP ZAP, SonarQube
- **Policy**: OPA/Gatekeeper (enforce no PHI in logs), Kyverno, Falco (runtime anomaly detection)
- **Pen Testing**: kube-bench (CIS K8s), kube-hunter, OpenVAS
- **SBOM**: Syft + Dependency-Track (every image, every release)

### AI / ML (Clinical Decision Support)
- **Risk Stratification**: ML model predicting 30-day readmission risk (Python + scikit-learn + MLflow)
- **Clinical NLP**: Named entity recognition on physician notes (spaCy + BERT fine-tuned on MIMIC-III)
- **Sepsis Alert**: Real-time early warning via Apache Flink (NEWS2 score + ML model on vital signs)
- **Drug Interaction**: Graph-based interaction checker (Neo4j + RxNorm dataset)
- **Medical Imaging AI**: Chest X-ray anomaly detection (PyTorch + MONAI framework)
- **Population Health**: Cohort analytics on ClickHouse — chronic disease management dashboards

---

## Key Design Decisions

1. **PHI never in logs**: Fluent Bit Lua filter strips/masks PHI fields (patient ID, DOB, diagnosis) before shipping to Loki
2. **Blue-green only for clinical services**: Canary rollouts too risky for prescription and order services — blue-green with instant rollback
3. **FHIR as integration layer**: All external system integrations (insurance, lab, pharmacy chain) go through FHIR gateway — no direct DB access
4. **Consent-first data model**: Every data access checked against patient consent store before processing
5. **Immutable audit trail**: Every PHI access event published to Kafka → append-only Elasticsearch index (tamper-evident, HIPAA §164.312(b))
6. **Telehealth isolation**: Video consultation runs in separate node pool with no access to clinical data plane (Zoom SDK / Jitsi)

---

## Compliance Controls

| Requirement        | Implementation                                                   |
|--------------------|------------------------------------------------------------------|
| HIPAA §164.312(a)  | Keycloak RBAC + MFA, session timeout 15 min for clinical staff   |
| HIPAA §164.312(b)  | Immutable audit log (Kafka → Elasticsearch, tamper-evident)      |
| HIPAA §164.312(c)  | Cosign image signing, OPA policy enforcement, Kyverno admission  |
| HIPAA §164.312(e)  | Istio mTLS (in-transit), AES-256 at rest, AWS KMS key management |
| GDPR Art. 17       | Automated data deletion workflows via gdpr-service               |
| ISO 27001 A.12.4   | Centralized logging with Loki, 7-year retention on audit logs    |

---

## Deployment Topology

| Environment | Cluster | Region                      | Notes                              |
|-------------|---------|-----------------------------|------------------------------------|
| dev         | kind    | local                       | PHI replaced with synthetic data   |
| staging     | EKS     | us-east-1                   | De-identified patient data only    |
| production  | EKS     | us-east-1 + eu-west-1       | PHI encrypted; HIPAA BAA with AWS  |

---

## Status

- [ ] Architecture design & FHIR data model
- [ ] Service registry & proto definitions
- [ ] HAPI FHIR R4 server integration
- [ ] Service skeletons (healthz, metrics, graceful shutdown)
- [ ] Docker Compose (local dev with synthetic PHI)
- [ ] Helm charts (per-service)
- [ ] CI/CD pipelines
- [ ] GitOps (ArgoCD)
- [ ] HIPAA security controls implementation
- [ ] Clinical AI/ML services
