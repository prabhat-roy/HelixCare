# data-retention

Service in the compliance domain of HelixCare.

Language: Go Â· Port: 50321

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/data-retention/](../../../helm/charts/data-retention/) â€” Helm chart
- [manifests/compliance/data-retention/](../../../manifests/compliance/data-retention/) â€” Raw K8s manifests
