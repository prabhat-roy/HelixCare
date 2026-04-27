# file-upload-service

Service in the platform domain of HelixCare.

Language: Go Â· Port: 51011

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/file-upload-service/](../../../helm/charts/file-upload-service/) â€” Helm chart
- [manifests/platform/file-upload-service/](../../../manifests/platform/file-upload-service/) â€” Raw K8s manifests
