terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"  # Specify the required provider version
    }
  }
  
  backend "s3" {
    bucket         = "my-terraform-state-bucket-marcel-1994"
    key            = "state/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}

# Specify the AWS provider configuration
provider "aws" {
  region = "us-east-1"  # Replace with your preferred AWS region
}

# Create an S3 bucket with tags
resource "aws_s3_bucket" "example_bucket" {
  bucket = "example-marcel-aws-tf-240794-testbucket"  # Ensure uniqueness

  tags = {
    Name        = "ExampleBucket"
    Environment = "New"
  }
}

# Create another S3 bucket
resource "aws_s3_bucket" "example" {
  bucket = "my-demo-bucket-marcel-240794"
}

# Create Glue job S3 bucket
resource "aws_s3_bucket" "glue_job_bucket" {
  bucket = "my-glue-jobs-bucket-marcel-240794"
}


resource "aws_s3_object" "glue_script" {
  bucket = "aws_s3_bucket.glue_job_bucket.id"
  key    = "scripts/glue-script.py"
  source = "glue-script.py"
  acl    = "private"
}



# Create an AWS Glue job
resource "aws_glue_job" "example_glue_job" {
  name     = "example-glue-job"
  role_arn = aws_iam_role.glue_service_role.arn  # Replace with a valid IAM role ARN

  command {
    name            = "glueetl"
    script_location = "s3://my-glue-jobs-bucket-marcel-240794/scripts/glue-script.py"  # Ensure the script exists
    python_version  = "3"
  }

  max_retries      = 1
  timeout          = 10

  default_arguments = {
    "--job-language"    = "python"
    "--TempDir"         = "s3://my-glue-jobs-bucket-marcel-240794/temp/"
  }
}



