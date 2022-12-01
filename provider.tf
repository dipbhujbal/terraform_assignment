provider "aws" {
  region                   = var.aws-region
  shared_credentials_files = ["~/.aws/credentials"]
}
