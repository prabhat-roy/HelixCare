# drug-interaction

Service in the pharmacy domain of HelixCare.

Language: Go Â· Port: 50122

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/drug-interaction/](../../../helm/charts/drug-interaction/) â€” Helm chart
- [manifests/pharmacy/drug-interaction/](../../../manifests/pharmacy/drug-interaction/) â€” Raw K8s manifests
