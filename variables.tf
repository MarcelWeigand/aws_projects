

data "aws_caller_identity" "current" {}



locals {
    account_id = data.aws_caller_identity.current.account_id

    environment = local.account_id == "145023116801" ? "dev" : "prod"
}


resource "aws_s3_bucket" "test-bucket" {
  bucket = "test-bucket-${local.account_id}"
    tags = {
    Environment = local.environment
  }
}