package helixcare.admission

import future.keywords.if
import future.keywords.in

default allow := false
allow if { count(deny) == 0 }

deny[msg] if {
    input.request.kind.kind in {"Pod","Deployment","StatefulSet","DaemonSet"}
    container := input.request.object.spec.template.spec.containers[_]
    not startswith(container.image, "harbor.helixcare.internal/")
    msg := sprintf("image %q must be from harbor.helixcare.internal", [container.image])
}

deny[msg] if {
    input.request.kind.kind == "Pod"
    input.request.object.spec.hostNetwork == true
    msg := "hostNetwork is forbidden"
}

deny[msg] if {
    input.request.kind.kind in {"Deployment","StatefulSet"}
    container := input.request.object.spec.template.spec.containers[_]
    not container.resources.limits.memory
    msg := sprintf("container %q is missing resources.limits.memory", [container.name])
}

deny[msg] if {
    input.request.kind.kind in {"Deployment","StatefulSet","DaemonSet"}
    container := input.request.object.spec.template.spec.containers[_]
    not container.securityContext.readOnlyRootFilesystem
    msg := sprintf("container %q must set readOnlyRootFilesystem=true", [container.name])
}

deny[msg] if {
    input.request.kind.kind in {"Deployment","StatefulSet"}
    pod := input.request.object.spec.template
    pod.metadata.labels["helixcare.io/phi"] == "true"
    not pod.metadata.labels["topology.kubernetes.io/region"]
    msg := "PHI workload must declare topology.kubernetes.io/region label"
}
