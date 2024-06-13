output "dns-name" {
  description = "Website's domain"
  value       = "Your website's domain is ${aws_route53_record.website-domain.name}"
}
