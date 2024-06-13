terraform {
  backend "s3" {
    bucket = "javier-terraform-state-lyzem"
    key    = "website/ec2"
    region = "us-west-2"
  }
}
