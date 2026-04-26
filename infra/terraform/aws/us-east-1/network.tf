data "aws_availability_zones" "this" { state = "available" }

locals { azs = slice(data.aws_availability_zones.this.names, 0, var.az_count) }

resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags                 = { Name = "helixcare-${var.environment}-us-east-1" }
}

resource "aws_subnet" "private" {
  count                   = var.az_count
  vpc_id                  = aws_vpc.this.id
  availability_zone       = local.azs[count.index]
  cidr_block              = cidrsubnet(var.vpc_cidr, 4, count.index)
  map_public_ip_on_launch = false
  tags = {
    Name                              = "helixcare-private-${count.index}"
    "kubernetes.io/role/internal-elb" = "1"
    "helixcare.io/phi-allowed"        = "true"
  }
}

resource "aws_subnet" "public" {
  count                   = var.az_count
  vpc_id                  = aws_vpc.this.id
  availability_zone       = local.azs[count.index]
  cidr_block              = cidrsubnet(var.vpc_cidr, 4, count.index + var.az_count)
  map_public_ip_on_launch = true
  tags = {
    Name                       = "helixcare-public-${count.index}"
    "kubernetes.io/role/elb"   = "1"
    "helixcare.io/phi-allowed" = "false"
  }
}

resource "aws_internet_gateway" "this" { vpc_id = aws_vpc.this.id }

resource "aws_eip" "nat" {
  count  = var.az_count
  domain = "vpc"
}

resource "aws_nat_gateway" "this" {
  count         = var.az_count
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.public[count.index].id
  depends_on    = [aws_internet_gateway.this]
}

# Block egress to other regions for PHI subnets (defense-in-depth via VPC endpoints)
resource "aws_vpc_endpoint" "s3" {
  vpc_id            = aws_vpc.this.id
  service_name      = "com.amazonaws.us-east-1.s3"
  vpc_endpoint_type = "Gateway"
}
