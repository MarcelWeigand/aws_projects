# Specify the required provider
provider "aws" {
  region = "us-east-1" # Replace with your preferred AWS region
}


terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-marcel-1994"
    key            = "state/terraform.tfstate"  # Path inside the bucket
    region         = "us-east-1"
    encrypt        = true                        # Encrypt state at rest
  }
}


# Create an S3 bucket
resource "aws_s3_bucket" "example_bucket" {
  bucket = "example-marcel-aws-tf-240794-testbucket" # Replace with a unique bucket name
  

  tags = {
    Name        = "ExampleBucket"
    Environment = "New"
  }
}


resource "aws_s3_bucket" "example" {
  bucket = "my-demo-bucket-marcel-240794"
}
