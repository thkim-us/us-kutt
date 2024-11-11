module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.1.0"

  name                 = "kutt-vpc"
  cidr                 = var.vpc_cidr
  azs                  = ["ap-northeast-2a", "ap-northeast-2b"]
  public_subnets       = var.public_subnets
  private_subnets      = var.private_subnets
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
  tags = {
    Name = "kutt-vpc"
  }
}
