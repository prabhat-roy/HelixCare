import http from "k6/http";
export const options = {
  stages: [
    { duration: "30s", target: 50 },
    { duration: "30s", target: 1000 },
    { duration: "30s", target: 50 },
  ],
};
export default function () { http.get("https://helixcare.internal/api/list"); }
