#S3 Bucket Name
variable "bucket_name"{
  description = "This is the Name of the S3 bucket in this account where the output should go."
  type        = string
  default     = ""
}

#CloudFront OAI
variable "cloudfront_origin_access_id" {
  type = string
  default = ""
}