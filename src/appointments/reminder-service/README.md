# reminder-service

Service in the **appointments** domain of HelixCare.

**Language:** Go · **Port:** 50062

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/reminder-service/](../../../helm/charts/reminder-service/) — Helm chart
- [manifests/appointments/reminder-service/](../../../manifests/appointments/reminder-service/) — Raw K8s manifests
