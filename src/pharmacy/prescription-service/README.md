# prescription-service

Service in the pharmacy domain of HelixCare.

Language: Go Â· Port: 50120

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/prescription-service/](../../../helm/charts/prescription-service/) â€” Helm chart
- [manifests/pharmacy/prescription-service/](../../../manifests/pharmacy/prescription-service/) â€” Raw K8s manifests
