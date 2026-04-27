import http from "k6/http";
import { check, sleep } from "k6";
export const options = { vus: 50, duration: "5m", thresholds: { http_req_duration: ["p(95)<800"] } };
const BASE = "https://helixcare.internal";
export default function () {
  http.get(`${BASE}/api/list?page=1`);
  sleep(0.5);
  http.get(`${BASE}/api/list?page=2`);
  sleep(0.5);
  const r = http.get(`${BASE}/api/detail/sample-id`);
  check(r, { "200": (x) => x.status === 200 });
  sleep(1);
}
