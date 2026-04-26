# bed-service

Service in the **ward-management** domain of HelixCare.

**Language:** Go · **Port:** 50220

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/bed-service/](../../../helm/charts/bed-service/) — Helm chart
- [manifests/ward-management/bed-service/](../../../manifests/ward-management/bed-service/) — Raw K8s manifests
