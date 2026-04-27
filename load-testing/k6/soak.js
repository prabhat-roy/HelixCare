import http from "k6/http";
export const options = { vus: 100, duration: "2h", thresholds: { http_req_duration: ["p(95)<800"] } };
export default function () { http.get("https://helixcare.internal/api/list"); }
