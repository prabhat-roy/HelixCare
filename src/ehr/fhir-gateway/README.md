# fhir-gateway

Service in the ehr domain of HelixCare.

Language: Go Â· Port: 50200

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/fhir-gateway/](../../../helm/charts/fhir-gateway/) â€” Helm chart
- [manifests/ehr/fhir-gateway/](../../../manifests/ehr/fhir-gateway/) â€” Raw K8s manifests
