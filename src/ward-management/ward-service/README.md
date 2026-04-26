# ward-service

Service in the **ward-management** domain of HelixCare.

**Language:** Go · **Port:** 50221

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/ward-service/](../../../helm/charts/ward-service/) — Helm chart
- [manifests/ward-management/ward-service/](../../../manifests/ward-management/ward-service/) — Raw K8s manifests
