# dispensing-service

Service in the pharmacy domain of HelixCare.

Language: Go Â· Port: 50123

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/dispensing-service/](../../../helm/charts/dispensing-service/) â€” Helm chart
- [manifests/pharmacy/dispensing-service/](../../../manifests/pharmacy/dispensing-service/) â€” Raw K8s manifests
