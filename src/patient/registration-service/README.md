# registration-service

Service in the **patient** domain of HelixCare.

**Language:** Go · **Port:** 50040

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/registration-service/](../../../helm/charts/registration-service/) — Helm chart
- [manifests/patient/registration-service/](../../../manifests/patient/registration-service/) — Raw K8s manifests
