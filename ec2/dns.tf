data "terraform_remote_state" "dns" {
  backend = "s3"
  config = {
    bucket = var.bucket
    key    = "dns/dns-zone"
    region = var.region
  }
}

resource "aws_eip" "personal-eip" {}

resource "aws_eip_association" "eip-assoc" {
  instance_id   = aws_instance.web.id
  allocation_id = aws_eip.personal-eip.id
}

resource "aws_route53_record" "website-domain" {
  zone_id = data.terraform_remote_state.dns.outputs.zone-id
  name    = "${var.subdomain}.${data.terraform_remote_state.dns.outputs.domain}"
  type    = "A"
  ttl     = 300
  records = [aws_eip.personal-eip.public_ip]
}
