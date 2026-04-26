# population-health

Service in the **analytics** domain of HelixCare.

**Language:** Go · **Port:** 50300

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/population-health/](../../../helm/charts/population-health/) — Helm chart
- [manifests/analytics/population-health/](../../../manifests/analytics/population-health/) — Raw K8s manifests
