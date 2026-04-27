# dead-letter-service

Service in the platform domain of HelixCare.

Language: Go Â· Port: 51010

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/dead-letter-service/](../../../helm/charts/dead-letter-service/) â€” Helm chart
- [manifests/platform/dead-letter-service/](../../../manifests/platform/dead-letter-service/) â€” Raw K8s manifests
