# geo-address-service

Service in the platform domain of HelixCare.

Language: Go Â· Port: 51013

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/geo-address-service/](../../../helm/charts/geo-address-service/) â€” Helm chart
- [manifests/platform/geo-address-service/](../../../manifests/platform/geo-address-service/) â€” Raw K8s manifests
