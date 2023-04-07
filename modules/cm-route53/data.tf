#Route53 Hosted Zone
data "aws_route53_zone" "selected" {
  name         = "${var.web_hosted_zone_name}."
}