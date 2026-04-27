# rate-limit-service

Service in the platform domain of HelixCare.

Language: Go Â· Port: 51007

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/rate-limit-service/](../../../helm/charts/rate-limit-service/) â€” Helm chart
- [manifests/platform/rate-limit-service/](../../../manifests/platform/rate-limit-service/) â€” Raw K8s manifests
