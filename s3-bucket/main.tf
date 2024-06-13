resource "random_string" "random" {
  length  = 5
  special = false
  lower   = true
  upper   = false
  numeric = false
  lifecycle {
    ignore_changes = [
      length,
      lower,
      upper,
      numeric,
      special,
    ]
  }
}

locals {
  bucket_name = "${var.user}-terraform-state-${random_string.random.result}"
}

module "s3-bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.1.2"

  bucket        = local.bucket_name
  create_bucket = true
  force_destroy = true
}
