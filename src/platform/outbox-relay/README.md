# outbox-relay

Service in the platform domain of HelixCare.

Language: Go Â· Port: 51002

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/outbox-relay/](../../../helm/charts/outbox-relay/) â€” Helm chart
- [manifests/platform/outbox-relay/](../../../manifests/platform/outbox-relay/) â€” Raw K8s manifests
