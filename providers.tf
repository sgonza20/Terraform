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
  access_key = "AKIAYHLMEBXB4O24NUBK"
  secret_key = "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"
}