terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.32.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = var.region
}

resource "aws_s3_bucket" "tf-test-aws-s3-bucket" {
  bucket = "tf-test-aws-s3-bucket"
}

resource "aws_s3_object" "bucket-data" {
  bucket = aws_s3_bucket.tf-test-aws-s3-bucket.bucket
  source = "./myfile.txt"
  key    = "data.txt"
  
}