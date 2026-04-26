# rbac-service

Service in the **identity** domain of HelixCare.

**Language:** Go · **Port:** 50022

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/rbac-service/](../../../helm/charts/rbac-service/) — Helm chart
- [manifests/identity/rbac-service/](../../../manifests/identity/rbac-service/) — Raw K8s manifests
