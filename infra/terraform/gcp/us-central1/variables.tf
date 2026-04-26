variable "project"     { type = string }
variable "environment" { type = string  default = "prod" }
variable "gke_version" { type = string  default = "1.31" }
variable "node_min"    { type = number  default = 6 }
variable "node_max"    { type = number  default = 60 }
variable "machine_type"{ type = string  default = "n2-standard-8" }
