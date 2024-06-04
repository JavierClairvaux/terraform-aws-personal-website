# data "aws_ami" "aml" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["al2023-ami-2023.4.*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["137112412989"] 
# }

# resource "aws_instance" "web" {
#   ami           = data.aws_ami.aml.id
#   instance_type = "t2.micro"
#   key_name = "wsl"


#   tags = {
#     Owner = "${var.user}"
#   }
# }