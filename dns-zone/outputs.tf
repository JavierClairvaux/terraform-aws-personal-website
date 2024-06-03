locals {
  full_list   = concat(["Your list of name servers:"], aws_route53_zone.main.name_servers)
  full_string = join("\n", local.full_list)
}

output "name-servers-hr" {
  description = "Human readable names servers list"
  value       = local.full_string
}

output "name-servers" {
  description = "name servers for domain name"
  value       = aws_route53_zone.main.name_servers
}

output "zone-id" {
  description = "name servers for domain name"
  value       = aws_route53_zone.main.zone_id
}

