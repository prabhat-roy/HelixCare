# email-service

Service in the communications domain of HelixCare.

Language: Go Â· Port: 50281

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/email-service/](../../../helm/charts/email-service/) â€” Helm chart
- [manifests/communications/email-service/](../../../manifests/communications/email-service/) â€” Raw K8s manifests
