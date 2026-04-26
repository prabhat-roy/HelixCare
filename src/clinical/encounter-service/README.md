# encounter-service

Service in the **clinical** domain of HelixCare.

**Language:** Go · **Port:** 50080

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/encounter-service/](../../../helm/charts/encounter-service/) — Helm chart
- [manifests/clinical/encounter-service/](../../../manifests/clinical/encounter-service/) — Raw K8s manifests
