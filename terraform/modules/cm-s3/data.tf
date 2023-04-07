#S3 IAM Policy Document
data "aws_iam_policy_document" "frontend" {
    statement {
      sid = "CloudFront"
      effect = "Allow"
      principals {
        type        = "AWS"
        identifiers = ["arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity ${var.cloudfront_origin_access_id}"]
      }

      actions = [
        "s3:GetObject"
      ]

      resources = [
        "${aws_s3_bucket.frontend.arn}/*",
      ]
    }
}