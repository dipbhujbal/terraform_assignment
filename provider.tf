
/*
resource "aws_s3_bucket" "tf-state" {
    bucket = "tf-state-trnnnnnnn"

   lifecycle {
     prevent_destroy = true
   }
    versioning {
      enabled = true
    }

    tags = {
        Name = "tf-state-trnnnnnn"
    }
}



resource "aws_dynamodb_table" "state-lock" {
   name = "tf-state-lock"
   depends_on = [
     aws_s3_bucket.tf-state
   ]
}
*/

provider "aws" {
  region                   = var.aws-region
  shared_credentials_files = ["~/.aws/credentials"]
}
