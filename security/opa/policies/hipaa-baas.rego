package helixcare.hipaa_baas

import future.keywords.if

# Reject any image whose base contains a vendor that has not signed a BAA.
allowed_baa_vendors := { "harbor.helixcare.internal", "registry.access.redhat.com", "gcr.io/distroless" }

default allow := false
allow if {
    img := input.image
    some v in allowed_baa_vendors
    startswith(img, v)
}
