resource "aws_s3_bucket_server_side_encryption_configuration" "s3_log_bucket_kms" {
  bucket = var.s3_log_bucket_id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.kms_log_bucket_arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_bucket_kms" {
  bucket = var.s3_bucket_id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.kms_bucket_arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_kms_key_policy" "kms_policy" {
  key_id = var.kms_bucket_arn
  policy = jsonencode({
    Id = "example"
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "Enable KMS and CloudFront"
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
          Service = "cloudfront.amazonaws.com"
        }
        Action = [
            "kms:Decrypt",
            "kms:Encrypt",
            "kms:GenerateDataKey"
        ]
        Resource = "*"
      }
    ]
    Condition = {
        "StringEquals" = {
            "AWS:": "arn:aws:cloudfront::${data.aws_caller_identity.current.account_id}:distribution/${var.cloudfront_distribution}"
        }
    }
})
}
