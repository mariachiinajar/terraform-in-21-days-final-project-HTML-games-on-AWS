# run https on your website.
# certifiacte is a combination of public key and private key.

resource "aws_acm_certificate" "main" {
  domain_name       = "www.your-new-domain.com"
  validation_method = "DNS"

  tags = {
    name = var.env_code
  }
}

resource "aws_route53_record" "domain_validation" {
  for_each = {
    for dvo in aws_acm_certificate.main.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }
  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.main.zone_id
}


# this resource points to the certificate, and point it to the number of records we created using the domain validation DNS.
resource "aws_acm_certificate_validation" "cert_validation" {
  certificate_arn         = aws_acm_certificate.main.arn
  validation_record_fqdns = [for record in aws_route53_record.domain_validation : record.fqdn]
}

