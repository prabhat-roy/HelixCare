# push-service

Service in the communications domain of HelixCare.

Language: Go Â· Port: 50282

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/push-service/](../../../helm/charts/push-service/) â€” Helm chart
- [manifests/communications/push-service/](../../../manifests/communications/push-service/) â€” Raw K8s manifests
