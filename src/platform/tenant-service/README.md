# tenant-service

Service in the **platform** domain of HelixCare.

**Language:** Go · **Port:** 51006

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/tenant-service/](../../../helm/charts/tenant-service/) — Helm chart
- [manifests/platform/tenant-service/](../../../manifests/platform/tenant-service/) — Raw K8s manifests
