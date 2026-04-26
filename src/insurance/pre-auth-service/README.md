# pre-auth-service

Service in the **insurance** domain of HelixCare.

**Language:** Go · **Port:** 50181

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/pre-auth-service/](../../../helm/charts/pre-auth-service/) — Helm chart
- [manifests/insurance/pre-auth-service/](../../../manifests/insurance/pre-auth-service/) — Raw K8s manifests
