output "s3_bucket" {
  description = "Bucket's ID"
  value       = module.s3-bucket.s3_bucket_id
}
