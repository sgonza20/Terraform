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
