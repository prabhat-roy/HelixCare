# event-replay-service

Service in the platform domain of HelixCare.

Language: Go Â· Port: 51009

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/event-replay-service/](../../../helm/charts/event-replay-service/) â€” Helm chart
- [manifests/platform/event-replay-service/](../../../manifests/platform/event-replay-service/) â€” Raw K8s manifests
