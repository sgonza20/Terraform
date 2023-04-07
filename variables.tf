#S3 Bucket Prefix Naming
variable "s3_bucket_prefix" {
  description = "S3 bucket prefix for lambda code"
  type = string
  default = "aws-cloudfront-frontend-website"

}

#AWS Region
variable "aws_region" {
  description = "AWS region for all resources."
  type    = string
  default = "us-east-1"
}

#S3 ACM Certificate ARN
variable "app_certificate_arn" {
  type = string
  description = "Application Certificate ARN"
  nullable = false
  default = "arn:aws:acm:us-east-1:565551828419:certificate/c16e330b-ffbb-4aa3-af98-b39bf4bb3adb"
}

#Hosted Zone Name
variable "app_hosted_zone_name" {
  type = string
  description = "Application route53 hosted zone name"
  nullable = false
  default = "smlozano.people.aws.dev"
}

#S3 Web Name
variable "app_name" {
  type = string
  description = "Application name tag"
  nullable = false
  default = "pae-frontend"
}