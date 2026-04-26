controller {
  name = "controller-1"
  database { url = "postgresql://boundary@postgres-boundary/helixcare" }
}
worker {
  name = "worker-helixcare-1"
  controllers = ["controller-1.boundary.helixcare.internal"]
}
kms "awskms" {
  purpose = "root"
  key_id  = "alias/helixcare-boundary"
}
