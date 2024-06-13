terraform {
  backend "s3" {
    bucket = "javier-terraform-state-lyzem"
    key    = "dns/dns-zone"
    region = "us-west-2"
  }
}
