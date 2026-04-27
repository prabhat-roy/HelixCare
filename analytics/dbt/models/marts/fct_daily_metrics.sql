{{ config(materialized="incremental", unique_key="metric_date") }}
SELECT
  DATE_TRUNC('day', TO_TIMESTAMP(event_time_ms / 1000)) AS metric_date,
  tenant_id,
  COUNT(*) AS events_total,
  COUNT(DISTINCT actor_id) AS active_actors
FROM {{ ref("stg_events") }}
{% if is_incremental() %}
WHERE event_time_ms > (SELECT MAX(EXTRACT(EPOCH FROM metric_date)) * 1000 FROM {{ this }})
{% endif %}
GROUP BY 1, 2
