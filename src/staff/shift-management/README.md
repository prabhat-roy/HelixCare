# shift-management

Service in the **staff** domain of HelixCare.

**Language:** Go · **Port:** 50240

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/shift-management/](../../../helm/charts/shift-management/) — Helm chart
- [manifests/staff/shift-management/](../../../manifests/staff/shift-management/) — Raw K8s manifests
