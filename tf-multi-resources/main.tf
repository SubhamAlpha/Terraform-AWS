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

locals {
  project="project-01"
}

    resource "aws_vpc" "mul_vpc" {
    cidr_block = "10.0.0.0/16"
    count = 1
    tags = {
        Name= "${local.project}-vpc-${count.index+1}"
    }
    }

    resource "aws_subnet" "main" {
    cidr_block = "10.0.${count.index + 1}.0/24"
    vpc_id = aws_vpc.mul_vpc[0].id
    count = 4
    tags = {
        Name= "${local.project}-subnet-${count.index + 1}"
    }
    }