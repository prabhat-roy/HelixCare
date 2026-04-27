# idempotency-service

Service in the platform domain of HelixCare.

Language: Go Â· Port: 51000

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/idempotency-service/](../../../helm/charts/idempotency-service/) â€” Helm chart
- [manifests/platform/idempotency-service/](../../../manifests/platform/idempotency-service/) â€” Raw K8s manifests
