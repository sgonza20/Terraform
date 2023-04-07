#Website Domain Name
variable "web_domain_name" {
  type = string
  default = ""
}

#ACM Certificate ARN
variable "web_certificate_arn" {
  type = string
  default = "arn:aws:acm:us-east-1:565551828419:certificate/c16e330b-ffbb-4aa3-af98-b39bf4bb3adb"
}

#Origin ID Root
variable "origin_id_root" {
  type = string
  default = ""
}

#S3 Bucket Regional Domain Name
variable "bucket_regional_domain_name" {
  type = string
  default = ""
}

variable "s3_log_bucket_id" {
  default = ""
}