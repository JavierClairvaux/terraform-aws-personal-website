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

data "template_file" "user-data" {
    template = "${file("${path.module}/templates/user-data.sh")}"

    vars = {
      domain = data.terraform_remote_state.dns.outputs.domain
      subdomain = var.subdomain
      email = var.email
      tls_enabled = var.tls_enabled
    }
}

resource "aws_instance" "web" {
  ami             = data.aws_ami.aml.id
  instance_type   = "t2.nano"
  key_name        = var.key_name
  subnet_id       = module.vpc.public_subnets[0]
  security_groups = [module.security-group.security_group_id]
  user_data_base64 = base64encode(data.template_file.user-data.rendered)

  tags = {
    Owner = "${var.user}"
  }

}
