# encounter-service

Service in the clinical domain of HelixCare.

Language: Go Â· Port: 50080

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/encounter-service/](../../../helm/charts/encounter-service/) â€” Helm chart
- [manifests/clinical/encounter-service/](../../../manifests/clinical/encounter-service/) â€” Raw K8s manifests
