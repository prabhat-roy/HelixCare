# drug-inventory

Service in the pharmacy domain of HelixCare.

Language: Go Â· Port: 50121

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/drug-inventory/](../../../helm/charts/drug-inventory/) â€” Helm chart
- [manifests/pharmacy/drug-inventory/](../../../manifests/pharmacy/drug-inventory/) â€” Raw K8s manifests
