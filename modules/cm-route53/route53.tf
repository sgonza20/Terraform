#Route53 Record for Web
resource "aws_route53_record" "webapp" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = var.web_domain_name
  type    = "A"
  alias {
    name                   = var.cloudfront_domain_name
    zone_id                = var.cloudfront_hosted_zone_id
    evaluate_target_health = true
  }
}

