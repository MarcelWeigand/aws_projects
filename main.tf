# Specify the required provider
provider "aws" {
  region = "us-east-1" # Replace with your preferred AWS region
}

# Create an S3 bucket
resource "aws_s3_bucket" "example_bucket" {
  bucket = "example-marcel-aws-tf-240794" # Replace with a unique bucket name
  acl    = "private"

  tags = {
    Name        = "ExampleBucket"
    Environment = "Dev"
  }
}
