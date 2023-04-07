terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.59.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region  = "us-east-1"
  profile = "smlozano"
  shared_credentials_files = ["/home/ec2-user/.aws/credentials"]
}