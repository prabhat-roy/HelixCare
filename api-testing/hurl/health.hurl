# Health check for all critical services
GET https://helixcare.internal/healthz
HTTP 200
[Asserts]
jsonpath "$.status" == "ok"

GET https://api.helixcare.internal/healthz
HTTP 200
[Asserts]
jsonpath "$.status" == "ok"
