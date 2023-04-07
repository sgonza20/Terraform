#Web Hosted Zone Name (Configured in Console)
variable "web_hosted_zone_name" {
  default = "smlozano.people.aws.dev"
  type    = string
}

#CloudFront Domain Name
variable "cloudfront_domain_name" {
  default = ""
  type    = string
}

#CloudFront Hosted Zone ID
variable "cloudfront_hosted_zone_id" {
  default = ""
  type    = string
}

#Web Domain Name
variable "web_domain_name" {
  type = string
  default = ""
}
