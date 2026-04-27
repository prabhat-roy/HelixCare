# population-health

Service in the analytics domain of HelixCare.

Language: Go Â· Port: 50300

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/population-health/](../../../helm/charts/population-health/) â€” Helm chart
- [manifests/analytics/population-health/](../../../manifests/analytics/population-health/) â€” Raw K8s manifests
