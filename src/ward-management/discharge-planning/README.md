# discharge-planning

Service in the ward-management domain of HelixCare.

Language: Go Â· Port: 50223

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/discharge-planning/](../../../helm/charts/discharge-planning/) â€” Helm chart
- [manifests/ward-management/discharge-planning/](../../../manifests/ward-management/discharge-planning/) â€” Raw K8s manifests
