resource "aws_s3_bucket" "log_bucket" {
  #checkov:skip=CKV_AWS_61:Lifecycle configuration not needed
  #checkov:skip=CKV_AWS_62:Event notification not needed
  #checkov:skip=CKV_AWS_144:Cross Region Replication not needed
  #checkov:skip=CKV_AWS_21:Versioning not needed
  #checkov:skip=CKV_AWS_145:KMS Encryption enables through another module
  #checkov:skip=CKV_AWS_19:Items in bucket are encrypted with KMS
  bucket = var.log_bucket_name
}

resource "aws_s3_bucket_acl" "log_bucket_acl" {
  bucket = aws_s3_bucket.log_bucket.id
  acl = "private"
}

resource "aws_s3_bucket_logging" "logging" {
  bucket = var.s3_bucket_name

  target_bucket = aws_s3_bucket.log_bucket.id
  target_prefix = "log/"
}

resource "aws_s3_bucket_public_access_block" "log_bucket" {
  bucket = aws_s3_bucket.log_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}