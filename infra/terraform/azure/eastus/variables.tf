variable "environment"     { type = string  default = "prod" }
variable "location"        { type = string  default = "eastus" }
variable "vnet_cidr"       { type = string  default = "10.70.0.0/16" }
variable "aks_version"     { type = string  default = "1.31" }
variable "node_min"        { type = number  default = 6 }
variable "node_max"        { type = number  default = 60 }
variable "vm_size"         { type = string  default = "Standard_D8s_v5" }
