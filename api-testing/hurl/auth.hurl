# Login + protected resource flow
POST https://api.helixcare.internal/v1/auth/login
Content-Type: application/json
{ "username": "ci-test", "password": "{{ password }}" }

HTTP 200
[Captures]
token: jsonpath "$.token"

GET https://api.helixcare.internal/v1/me
Authorization: Bearer {{ token }}
HTTP 200
[Asserts]
jsonpath "$.username" == "ci-test"
