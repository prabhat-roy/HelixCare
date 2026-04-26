# fhir-gateway

Service in the **ehr** domain of HelixCare.

**Language:** Go · **Port:** 50200

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/fhir-gateway/](../../../helm/charts/fhir-gateway/) — Helm chart
- [manifests/ehr/fhir-gateway/](../../../manifests/ehr/fhir-gateway/) — Raw K8s manifests
