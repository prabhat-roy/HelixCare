# radiology-service

Service in the **diagnostics** domain of HelixCare.

**Language:** Go · **Port:** 50101

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/radiology-service/](../../../helm/charts/radiology-service/) — Helm chart
- [manifests/diagnostics/radiology-service/](../../../manifests/diagnostics/radiology-service/) — Raw K8s manifests
