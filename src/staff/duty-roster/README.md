# duty-roster

Service in the **staff** domain of HelixCare.

**Language:** Go · **Port:** 50241

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/duty-roster/](../../../helm/charts/duty-roster/) — Helm chart
- [manifests/staff/duty-roster/](../../../manifests/staff/duty-roster/) — Raw K8s manifests
