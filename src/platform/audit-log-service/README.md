# audit-log-service

Service in the platform domain of HelixCare.

Language: Go Â· Port: 51008

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/audit-log-service/](../../../helm/charts/audit-log-service/) â€” Helm chart
- [manifests/platform/audit-log-service/](../../../manifests/platform/audit-log-service/) â€” Raw K8s manifests
