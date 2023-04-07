terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.74"
    }
  }
}

provider "aws" {
  # Configuration options
  region  = "us-east-1"
  profile = "default"
  shared_credentials_files = ["/home/ec2-user/.aws/credentials"]
}