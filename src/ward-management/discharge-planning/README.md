# discharge-planning

Service in the **ward-management** domain of HelixCare.

**Language:** Go · **Port:** 50223

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/discharge-planning/](../../../helm/charts/discharge-planning/) — Helm chart
- [manifests/ward-management/discharge-planning/](../../../manifests/ward-management/discharge-planning/) — Raw K8s manifests
