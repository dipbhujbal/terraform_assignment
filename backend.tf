terraform {
  backend "s3" {
    bucket = "tf-state-maintain"
    key    = "terraform.tfstate"
    dynamodb_table = "tf-state-lock"
    encrypt = true
    region = "ap-south-1"
  }
  }
