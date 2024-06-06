packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
    ansible = {
      version = ">= 1.1.1"
      source  = "github.com/hashicorp/ansible"
    }
  }
}

source "amazon-ebs" "amazon-linux" {
  ami_name      = "${var.user}-personal-website-${local.timestamp}"
  instance_type = "t2.micro"
  region        = "us-west-2"
  source_ami_filter {
    filters = {
      name                = "al2023-ami-2023.4.*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["137112412989"]
  }
  ssh_username = "ec2-user"
  temporary_security_group_source_cidrs = ["${var.personal_ip}/32"]
}

build {
  sources = [
    "source.amazon-ebs.amazon-linux"
  ]
  provisioner "ansible" {
    playbook_file = "./playbook.yml"
  }
}

locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}
