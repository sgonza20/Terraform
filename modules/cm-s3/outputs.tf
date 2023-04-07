#S3 Bucket ARN
output "s3_bucket_arn" {
  value = aws_s3_bucket.frontend.arn
}

#S3 Bucket Name
output "s3_bucket_name" {
  value = aws_s3_bucket.frontend.id
}

#S3 Bucket Regional Domain Name
output "bucket_regional_domain" {
  value = aws_s3_bucket.frontend.bucket_regional_domain_name
}