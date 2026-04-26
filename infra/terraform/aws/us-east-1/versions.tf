terraform {
  required_version = ">= 1.9.0"
  required_providers {
    aws        = { source = "hashicorp/aws",        version = "~> 5.70" }
    kubernetes = { source = "hashicorp/kubernetes", version = "~> 2.32" }
    helm       = { source = "hashicorp/helm",       version = "~> 2.15" }
    random     = { source = "hashicorp/random",     version = "~> 3.6" }
  }
  backend "s3" {
    bucket         = "helixcare-tfstate-aws-us-east-1"
    key            = "helixcare/aws/us-east-1/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "helixcare-tfstate-locks-us-east-1"
    encrypt        = true
    kms_key_id     = "alias/helixcare-tfstate-us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Project          = "helixcare"
      Environment      = var.environment
      ManagedBy        = "terraform"
      Cloud            = "aws"
      Region           = "us-east-1"
      Compliance       = "HIPAA"
      DataResidency    = "us-east-1"
    }
  }
}
