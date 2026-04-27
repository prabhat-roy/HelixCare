# AI_PLAN.md â€” HelixCare (Healthcare Delivery & EHR Platform)

> Hierarchical AI/ML strategy. Reuses the Paperclip / OpenClaw / NemoClaw
> agent platform first defined in [ShopOS/AI.md](../ShopOS/AI.md). This file
> is the HelixCare-specific specialisation.

---

## 1. Why AI in HelixCare

Healthcare is the highest-stakes AI domain we operate in. Every model
ships with explicit human oversight and is treated as clinical decision
support, not a clinician replacement.

- NLP on clinical notes (HL7 FHIR, EHR free text) to surface missed
  diagnoses and improve documentation quality.
- Imaging triage (CXR, CT, MRI) to prioritise radiologist worklist.
- Patient risk stratification (sepsis, readmission, no-show) to drive
  proactive care.
- Voice-to-EHR (ambient scribing) so clinicians spend more time with
  patients and less with the keyboard.
- Drug-interaction and allergy alerts beyond basic rule sets.

HIPAA, GDPR, MDR/IVDR (EU), 21 CFR Part 11 (FDA), NHS DSPT â€” all bind.
Models that drive clinical decisions are registered as software-as-a-
medical-device (SaMD) where required.

---

## 2. Domain-Specific AI/ML Use Cases

| # | Use case | Domain | Model class | Latency budget |
|---|----------|--------|-------------|----------------|
| 1 | Clinical decision support (CDS) on FHIR Composition | clinical, ehr | Llama 3.1 70B + Med-PaLM-style fine-tune + rules | <2 s |
| 2 | Medical imaging triage (CXR pneumonia, ICH on CT) | radiology | Custom CNN / ViT (MONAI) | <3 s/study |
| 3 | NLP on clinical notes (problem-list reconciliation) | ehr, hcc-coding | BioBERT + ClinicalBERT + LLM extractor | nightly |
| 4 | Drug-drug interaction + allergy detection | pharmacy, clinical | Rule engine + Llama 3.1 + RxNorm KG | <500 ms |
| 5 | Patient risk stratification (sepsis, readmit, NEWS2) | inpatient, ed | XGBoost + LightGBM + rule-fusion | streaming |
| 6 | Appointment no-show prediction | scheduling, ops | LightGBM | nightly |
| 7 | Ambient voice scribing (clinic visit â†’ note) | clinical, ehr | Whisper-large-v3 + Llama 3.1 70B + FHIR mapper | <2 min from end of visit |
| 8 | Prior-auth prediction + autopopulation | revenue-cycle | Llama 3.1 + Donut on payer forms | <3 s |
| 9 | Coding assistance (ICD-10-CM, CPT, HCC) | revenue-cycle | LLM + KG + human-in-loop | <2 s |
| 10 | Bed / OR / clinic scheduling optimisation | ops | OR-Tools + LightGBM travel-time priors | hourly |
| 11 | Claim-denial prediction | revenue-cycle, finance | LightGBM + LLM rationale | <500 ms |
| 12 | Patient cohort discovery from FHIR | research, value-based | E5-large embeddings + Qdrant + filter | <1 s |

---

## 3. Hierarchical Agent Architecture

Reuses OpenClaw / Paperclip / NemoClaw from `ShopOS/AI.md`.

### Tier 0 â€” Master Architect Agent

`helix-architect` â€” researches AI tooling, proposes services, on-boards
Tier-1 leads, weekly written report. Read-only on prod.

### Tier 1 â€” Division Leads (5)

| Agent | Scope |
|-------|-------|
| `helix-dev-lead`        | Backend/frontend service code |
| `helix-devops-lead`     | Helm, GitOps, infra, CI |
| `helix-devsecops-lead`  | OPA, Vault, Cilium, Falco, HIPAA, MDR/IVDR |
| `helix-dataml-lead`     | Feature store, training, drift, SaMD lifecycle |
| `helix-platform-lead`   | Cross-cutting (idempotency, saga, outbox), FHIR runtime |

### Tier 2 â€” Specialist Agents

By language: Go, Java, Kotlin, Python, Node, Rust, TypeScript, Swift
(iOS).

By tool: PostgreSQL, MongoDB, Redis, Elasticsearch, OpenSearch,
TimescaleDB, MinIO, Cassandra, Kafka, NATS, RabbitMQ, MQTT, HAPI FHIR
server, OpenEMR-bridge, Mirth Connect (HL7v2), Vault, Keycloak,
OPA, Kyverno, Falco, Cilium, Istio, ArgoCD, Argo Workflows,
Prometheus, Grafana, Loki, Jaeger, OpenTelemetry, Trivy, Cosign,
MONAI Toolkit, Orthanc DICOM, OHIF Viewer, Camunda, OpenFGA, Wazuh,
Pulsar, Druid.

By service â€” one agent per microservice (~210). Owns README,
OpenAPI, tests, CHANGELOG, deps, /healthz.

### Tier 3 â€” Ephemeral Workers

Spawned for retraining a CXR classifier on new labelled studies,
generating clinical-note runbooks, building model bundles for clinic edge.

### Lifecycle

Research â†’ Document â†’ Implement â†’ Test â†’ Review â†’ Deploy â†’ Monitor â†’
Respond â†’ Upgrade â†’ Report. Plus a clinical-validation gate before
any patient-facing model rolls past shadow.

---

## 4. Separate AI Infrastructure

```
ai-platform/
â”œâ”€â”€ cluster: helix-ai-{aws,gcp,azure}     â† cloud GPU pool, HIPAA-eligible
â”œâ”€â”€ cluster: helix-ai-edge                â† in-clinic / hospital k3s
â”œâ”€â”€ namespace: helix-ai-control            â† Paperclip
â”œâ”€â”€ namespace: helix-ai-agents             â† OpenClaw runtime
â”œâ”€â”€ namespace: helix-ai-sandbox            â† NemoClaw â€” strict clinical guardrails
â”œâ”€â”€ namespace: helix-ai-models             â† vLLM, Ollama, LiteLLM, Triton, MONAI
â”œâ”€â”€ namespace: helix-ai-data               â† Qdrant, Weaviate, MinIO, MLflow
â”œâ”€â”€ namespace: helix-ai-obs                â† Langfuse, Phoenix
â””â”€â”€ namespace: helix-ai-pipelines          â† Argo Workflows + Kubeflow
```

### Hardware

- Cloud: A100 80GB for medical-imaging training (MONAI, nnU-Net);
  A10G / L4 for LLM inference.
- Hospital edge: Jetson Orin or RTX A4000 for OR / radiology desk
  inference, supporting near-zero PHI egress.
- All clouds in HIPAA-eligible regions (AWS HIPAA, GCP HIPAA, Azure HDS).

### Software stack

| Layer | Tool | Purpose |
|-------|------|---------|
| Cloud inference | vLLM, Triton | LLM + clinical NLP |
| Imaging | MONAI Deploy + Triton | CXR / CT / MRI |
| DICOM | Orthanc, OHIF | Imaging store + viewer |
| Local dev | Ollama | Offline / dev |
| Gateway | LiteLLM | OpenAI-compatible, quota, audit |
| Orchestrator | Paperclip | Task queue, audit |
| Agent platform | OpenClaw | Llama 3.1 70B |
| Sandbox | NemoClaw | NeMo Guardrails â€” clinical-safe |
| Vector | Qdrant | FHIR cohort embeddings |
| Vector | Weaviate | Multimodal (image + report) |
| MLOps | MLflow | Model registry, SaMD provenance |
| Clinical MLOps | Kubeflow Pipelines | Reproducible training pipelines |
| Workflows | Argo Workflows | Eval, retraining |
| Feature store | Feast | EHR features (de-identified) |
| Drift | Evidently | Population drift, calibration drift |
| LLM obs | Langfuse + Phoenix | Trace, cost, eval, audit |

### Data isolation

- All training data de-identified per HIPAA Safe Harbor (Philter
  + manual review) before reaching feature store.
- PHI never leaves region; HDS / HIPAA-eligible regions only.
- Vector DB sharded per tenant (hospital). No cross-tenant retrieval.
- Every prompt + completion â†’ Langfuse + Paperclip with MRN hashed.

---

## 5. Compliance & Guardrails

| Control | Mechanism |
|---------|-----------|
| HIPAA (US) | BAA on every cloud; PHI encrypted at rest/in-transit; audit log immutable |
| GDPR (EU) | DPIA per use case; right-to-erasure handler; lawful basis recorded |
| MDR / IVDR (EU) | Models that drive clinical decisions registered as SaMD; CE-mark process tracked |
| 21 CFR Part 11 (FDA) | All AI training and inference logs are tamper-evident (signed) |
| FDA SaMD / Good Machine Learning Practice (GMLP) | Every clinical model has a model card + lifecycle plan |
| NHS DSPT | Annual self-assessment automated by an agent |
| Clinical-validation gate | No patient-facing model leaves shadow without sign-off from a clinical safety officer |
| NemoClaw clinical policy | Blocks LLM giving definitive diagnoses, prescriptions, or dosage outside approved CDS contexts |

---

## 6. Implementation Roadmap

| Month | Milestone |
|-------|-----------|
| 1 | `helix-ai-*` HIPAA-eligible cluster up; vLLM Llama 3.1 70B |
| 2 | Paperclip + NemoClaw clinical policies; Tier-0 architect live |
| 3 | Tier-1 leads; CXR triage v0 shadow on retrospective set |
| 4 | Per-language / per-tool Tier-2 agents |
| 5 | Per-service Tier-2 agents (ehr â†’ clinical-decision â†’ revenue-cycle first) |
| 6 | Ambient voice scribing pilot in 1 clinic; coding-assist v1 |
| 7 | CDS v1 prod (low-risk pathways); risk stratification v1 |
| 8 | SaMD submission pipeline; multi-cloud failover drill |

---

## 7. Cost Envelope (target)

- Cloud infra: $6,500 â€“ $9,500 / month per primary cloud (HIPAA-region premium)
- Hospital edge: $4,000 one-time + $80/month ops
- No subscription LLM spend

---

## 8. Cross-References

- Master AI strategy: [ShopOS/AI.md](../ShopOS/AI.md)
- Same Paperclip/OpenClaw/NemoClaw platform across all 15 sibling projects.
