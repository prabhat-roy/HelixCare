import http from "k6/http";
import { check, sleep } from "k6";
export const options = { vus: 30, duration: "10m" };
const BASE = "https://helixcare.internal";
export default function () {
  const login = http.post(`${BASE}/api/auth/login`, JSON.stringify({ user: "loadtest", pass: "loadtest" }), { headers: { "Content-Type": "application/json" } });
  check(login, { "logged in": (r) => r.status === 200 });
  const token = login.json("token");
  const headers = { "Authorization": `Bearer ${token}`, "Content-Type": "application/json" };
  http.post(`${BASE}/api/cart/add`, JSON.stringify({ id: "sku-1", qty: 1 }), { headers });
  sleep(1);
  http.post(`${BASE}/api/checkout`, JSON.stringify({ payment: "card" }), { headers });
  sleep(2);
}
