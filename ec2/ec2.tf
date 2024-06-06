data "aws_ami" "aml" {
  most_recent = true

  filter {
    name   = "name"
    values = ["${var.user}-personal-website-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["self"]
}

resource "aws_instance" "web" {
  ami             = data.aws_ami.aml.id
  instance_type   = "t2.nano"
  key_name        = var.key_name
  subnet_id       = module.vpc.public_subnets[0]
  security_groups = [module.security-group.security_group_id]


  tags = {
    Owner = "${var.user}"
  }

}