# icu-management

Service in the ward-management domain of HelixCare.

Language: Go Â· Port: 50222

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/icu-management/](../../../helm/charts/icu-management/) â€” Helm chart
- [manifests/ward-management/icu-management/](../../../manifests/ward-management/icu-management/) â€” Raw K8s manifests
