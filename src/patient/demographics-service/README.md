# demographics-service

Service in the **patient** domain of HelixCare.

**Language:** Go · **Port:** 50043

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/demographics-service/](../../../helm/charts/demographics-service/) — Helm chart
- [manifests/patient/demographics-service/](../../../manifests/patient/demographics-service/) — Raw K8s manifests
