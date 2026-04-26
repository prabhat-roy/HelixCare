# file-upload-service

Service in the **platform** domain of HelixCare.

**Language:** Go · **Port:** 51011

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/file-upload-service/](../../../helm/charts/file-upload-service/) — Helm chart
- [manifests/platform/file-upload-service/](../../../manifests/platform/file-upload-service/) — Raw K8s manifests
