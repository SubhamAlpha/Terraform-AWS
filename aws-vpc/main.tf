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
resource "aws_vpc" "my_vpc_tf" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name="tf-vpc"
    }
}

#create private subnet
resource "aws_subnet" "private_subnet_tf" {
    vpc_id = aws_vpc.my_vpc_tf.id
    cidr_block = "10.0.1.0/24"
    tags = {
      Name="tf-private-subnet"
    }
}

