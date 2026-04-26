# credentialing-service

Service in the **staff** domain of HelixCare.

**Language:** Go · **Port:** 50242

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/credentialing-service/](../../../helm/charts/credentialing-service/) — Helm chart
- [manifests/staff/credentialing-service/](../../../manifests/staff/credentialing-service/) — Raw K8s manifests
