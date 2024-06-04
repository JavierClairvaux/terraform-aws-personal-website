module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.user}-vpc"
  cidr = "10.0.0.0/16"

  azs                = ["us-west-2a", ]
  private_subnets    = ["10.0.1.0/24", ]
  public_subnets     = ["10.0.101.0/24", ]
  enable_nat_gateway = true
  map_public_ip_on_launch = true

  tags = {
    Terraform = "true"
    Owner     = var.user
  }
}

module "security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.2"

  name = "${var.user}-website"
  description = "${var.user} personal website security group"
  vpc_id = module.vpc.vpc_id
  ingress_with_cidr_blocks = [
    {
      rule        = "ssh-tcp"
      cidr_blocks = "${var.personal_ip}/32"
    },
    {
      rule        = "https-443-tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      rule        = "http-80-tcp"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}