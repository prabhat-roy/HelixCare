package helixcare.region_residency

import future.keywords.if
import future.keywords.in

# Authorize a cross-pod connection only when source and destination share region for PHI flows.
#  input := {
#    "source":      { "region": "us-east-1", "phi": true|false, "namespace": "...", "service": "..." },
#    "destination": { "region": "us-east-1", "phi": true|false, "namespace": "...", "service": "..." },
#    "data_class":  "phi|non-phi"
#  }

default allow := false

allow if { input.data_class == "non-phi" }

allow if {
    input.data_class == "phi"
    input.source.region == input.destination.region
}

deny[msg] if {
    input.data_class == "phi"
    input.source.region != input.destination.region
    msg := sprintf("PHI flow blocked: source region %q != destination region %q", [input.source.region, input.destination.region])
}

# Approved cross-region traffic for analytics is restricted to de-identified buckets.
allow if {
    input.data_class == "phi"
    input.source.region != input.destination.region
    input.destination.namespace == "helixcare-deid-analytics"
    input.destination.service in {"deid-pipeline","aggregate-store"}
}
