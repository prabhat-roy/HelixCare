# Tiltfile for HelixCare local dev hot-reload
load("ext://restart_process", "docker_build_with_restart")

allow_k8s_contexts(["kind-helixcare", "minikube", "docker-desktop"])

local_resource("buf-generate", cmd="buf generate", deps=["proto/"])

services = ["api-gateway", "identity-service", "platform-bff"]
for s in services:
    docker_build("helixcare/" + s, "src/" + s, dockerfile="src/" + s + "/Dockerfile")
    k8s_yaml("manifests/" + s + ".yaml")
    k8s_resource(s, port_forwards=[8080])
