# adjudication-service

Service in the insurance domain of HelixCare.

Language: Go Â· Port: 50183

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/adjudication-service/](../../../helm/charts/adjudication-service/) â€” Helm chart
- [manifests/insurance/adjudication-service/](../../../manifests/insurance/adjudication-service/) â€” Raw K8s manifests
