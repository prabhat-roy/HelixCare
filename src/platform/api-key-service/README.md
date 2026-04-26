# api-key-service

Service in the **platform** domain of HelixCare.

**Language:** Go · **Port:** 51003

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/api-key-service/](../../../helm/charts/api-key-service/) — Helm chart
- [manifests/platform/api-key-service/](../../../manifests/platform/api-key-service/) — Raw K8s manifests
