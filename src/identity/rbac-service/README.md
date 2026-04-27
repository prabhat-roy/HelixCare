# rbac-service

Service in the identity domain of HelixCare.

Language: Go Â· Port: 50022

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/rbac-service/](../../../helm/charts/rbac-service/) â€” Helm chart
- [manifests/identity/rbac-service/](../../../manifests/identity/rbac-service/) â€” Raw K8s manifests
