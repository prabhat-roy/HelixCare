# credentialing-service

Service in the staff domain of HelixCare.

Language: Go Â· Port: 50242

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/credentialing-service/](../../../helm/charts/credentialing-service/) â€” Helm chart
- [manifests/staff/credentialing-service/](../../../manifests/staff/credentialing-service/) â€” Raw K8s manifests
