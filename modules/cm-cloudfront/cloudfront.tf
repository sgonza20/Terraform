#CloudFront OAI
resource "aws_cloudfront_origin_access_identity" "oai"{
    comment = "Token for restricted access"
}


#CLoudFront Distribution
resource "aws_cloudfront_distribution" "frontend" {
    enabled                 = true
    is_ipv6_enabled         = false
    default_root_object     = "index.html"
    aliases                 = [var.web_domain_name]
    price_class             = "PriceClass_200"


    restrictions {
        geo_restriction {
            restriction_type = "none"
        }
    }

    viewer_certificate {
        acm_certificate_arn = var.web_certificate_arn
        ssl_support_method  = "sni-only"
    }

    origin {
        origin_id   = var.origin_id_root
        domain_name = var.bucket_regional_domain_name

        s3_origin_config {
            origin_access_identity = aws_cloudfront_origin_access_identity.oai.cloudfront_access_identity_path
        }
    }
    default_cache_behavior {
        allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
        cached_methods   = ["GET", "HEAD"]
        target_origin_id = var.origin_id_root

        forwarded_values {
            query_string = false
            cookies {
                forward = "none"
            }
        }

        viewer_protocol_policy = "redirect-to-https"
        min_ttl                = 0
        default_ttl            = 3600
        max_ttl                = 86400
    }
}