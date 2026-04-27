# saga-orchestrator

Service in the platform domain of HelixCare.

Language: Go Â· Port: 51001

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/saga-orchestrator/](../../../helm/charts/saga-orchestrator/) â€” Helm chart
- [manifests/platform/saga-orchestrator/](../../../manifests/platform/saga-orchestrator/) â€” Raw K8s manifests
