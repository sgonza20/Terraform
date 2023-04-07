variable "s3_log_bucket_id" {
  default = ""
}
variable "s3_bucket_id" {
  default = ""
}

variable "kms_log_bucket_arn" {
  default = "arn:aws:kms:us-east-1:565551828419:key/4f7c1da4-b302-4a4d-81fa-0ecb3bffddcf"
}

variable "kms_bucket_arn" {
  default = "arn:aws:kms:us-east-1:565551828419:key/19d16c60-716e-4885-8872-b7f204a608d6"
}

variable "cloudfront_distribution" {
  default = ""
}