#Static Bucket for Website
resource "aws_s3_bucket" "frontend" {
  #checkov:skip=CKV_AWS_18:Access logging is enabled in another CM
  #checkov:skip=CKV2_AWS_61:Lifecycle configuration not needed
  #checkov:skip=CKV2_AWS_62:Event notification not needed
  #checkov:skip=CKV_AWS_144:Cross Region Replication not needed
  #checkov:skip=CKV_AWS_21:Versioning not needed
  #checkov:skip=CKV_AWS_145:KMS Encryption enables through another module
  #checkov:skip=CKV_AWS_19:Items in bucket are encrypted with KMS
  bucket = var.bucket_name
  force_destroy = true

}
#S3 Website Configuration for Web
resource "aws_s3_bucket_website_configuration" "example-config" {
  bucket = aws_s3_bucket.frontend.id

  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}

#S3 Bucket Policy Attachment
resource "aws_s3_bucket_policy" "frontend" {
  bucket = aws_s3_bucket.frontend.id
  policy = data.aws_iam_policy_document.frontend.json
}

resource "aws_s3_bucket_public_access_block" "frontend" {
  bucket = aws_s3_bucket.frontend.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}