# webhook-delivery-service

Service in the platform domain of HelixCare.

Language: Go Â· Port: 51004

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/webhook-delivery-service/](../../../helm/charts/webhook-delivery-service/) â€” Helm chart
- [manifests/platform/webhook-delivery-service/](../../../manifests/platform/webhook-delivery-service/) â€” Raw K8s manifests
