# pre-auth-service

Service in the insurance domain of HelixCare.

Language: Go Â· Port: 50181

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/pre-auth-service/](../../../helm/charts/pre-auth-service/) â€” Helm chart
- [manifests/insurance/pre-auth-service/](../../../manifests/insurance/pre-auth-service/) â€” Raw K8s manifests
