module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.24"

  cluster_name                   = "helixcare-${var.environment}-us-east-1"
  cluster_version                = var.eks_version
  vpc_id                         = aws_vpc.this.id
  subnet_ids                     = aws_subnet.private[*].id
  cluster_endpoint_public_access = true
  enable_irsa                    = true

  eks_managed_node_groups = {
    general = {
      min_size       = var.node_min
      max_size       = var.node_max
      desired_size   = var.node_min
      instance_types = [var.node_instance]
      capacity_type  = "ON_DEMAND"
      labels         = { "helixcare.io/node-class" = "general", "topology.kubernetes.io/region" = "us-east-1" }
    }
    ml = {
      min_size       = 2
      max_size       = 10
      desired_size   = 2
      instance_types = ["g5.2xlarge"]
      capacity_type  = "ON_DEMAND"
      labels         = { "helixcare.io/node-class" = "ml", "topology.kubernetes.io/region" = "us-east-1" }
      taints         = [{ key = "ml-only", value = "true", effect = "NO_SCHEDULE" }]
    }
    telehealth = {
      min_size       = 3
      max_size       = 30
      desired_size   = 3
      instance_types = ["c6in.2xlarge"]
      capacity_type  = "ON_DEMAND"
      labels         = { "helixcare.io/node-class" = "telehealth", "topology.kubernetes.io/region" = "us-east-1" }
    }
  }

  cluster_addons = {
    coredns            = { most_recent = true }
    kube-proxy         = { most_recent = true }
    vpc-cni            = { most_recent = true }
    aws-ebs-csi-driver = { most_recent = true }
  }
}
