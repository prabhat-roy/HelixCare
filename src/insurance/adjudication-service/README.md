# adjudication-service

Service in the **insurance** domain of HelixCare.

**Language:** Go · **Port:** 50183

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/adjudication-service/](../../../helm/charts/adjudication-service/) — Helm chart
- [manifests/insurance/adjudication-service/](../../../manifests/insurance/adjudication-service/) — Raw K8s manifests
