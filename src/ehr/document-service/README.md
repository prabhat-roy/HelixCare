# document-service

Service in the **ehr** domain of HelixCare.

**Language:** Go · **Port:** 50201

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/document-service/](../../../helm/charts/document-service/) — Helm chart
- [manifests/ehr/document-service/](../../../manifests/ehr/document-service/) — Raw K8s manifests
