# profile-service

Service in the **patient** domain of HelixCare.

**Language:** Go · **Port:** 50041

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/profile-service/](../../../helm/charts/profile-service/) — Helm chart
- [manifests/patient/profile-service/](../../../manifests/patient/profile-service/) — Raw K8s manifests
