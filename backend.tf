terraform {
  backend "s3" {
    bucket = "pipeline-terraform-backup-state-file-2023"
    key    = "remote.tfstate"
    region = "us-east-1"
  }
}
