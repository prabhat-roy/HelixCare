# sso-service

Service in the identity domain of HelixCare.

Language: Go Â· Port: 50021

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/sso-service/](../../../helm/charts/sso-service/) â€” Helm chart
- [manifests/identity/sso-service/](../../../manifests/identity/sso-service/) â€” Raw K8s manifests
