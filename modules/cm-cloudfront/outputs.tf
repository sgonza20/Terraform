#Output CloudFront Distribution Domain Name
output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.frontend.domain_name
}

#Output CloudFront Distribution Hosted Zone ID
output "cloudfront_hosted_zone_id" {
  value = aws_cloudfront_distribution.frontend.hosted_zone_id
}

#Output CloudFront OAI
output "cloudfront_origin_access_id" {
  value = aws_cloudfront_origin_access_identity.oai.id
}

output "cloudfront_distribution" {
  value = aws_cloudfront_distribution.frontend.id
}