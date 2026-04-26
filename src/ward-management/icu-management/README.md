# icu-management

Service in the **ward-management** domain of HelixCare.

**Language:** Go · **Port:** 50222

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/icu-management/](../../../helm/charts/icu-management/) — Helm chart
- [manifests/ward-management/icu-management/](../../../manifests/ward-management/icu-management/) — Raw K8s manifests
