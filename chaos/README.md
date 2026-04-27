# Chaos engineering for HelixCare
- `chaos-mesh/` — pod, network, stress, IO, DNS, time experiments + weekly game-day workflow + cron schedule
- `litmus/` — alternate experiments + Argo Workflow for post-chaos validation
Run: `kubectl apply -f chaos-mesh/<experiment>.yaml`
