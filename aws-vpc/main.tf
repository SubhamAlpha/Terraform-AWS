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
  region = "eu-north-1"
}

#create VPC
resource "aws_vpc" "my_vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name="tf-vpc"
    }
}
