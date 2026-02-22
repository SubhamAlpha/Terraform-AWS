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

#public subnet
resource "aws_subnet" "public_subnet_tf" {
    vpc_id = aws_vpc.my_vpc_tf.id
    cidr_block = "10.0.2.0/24"
    tags = {
      Name="tf-public-subnet"
    }
}

#internet gateway
resource "aws_internet_gateway" "my_igw_tf" {
    vpc_id = aws_vpc.my_vpc_tf.id
    tags = {
      Name="tf-igw"
    }
}

#routing table
resource "aws_route_table" "my_route_table_tf" {
    vpc_id = aws_vpc.my_vpc_tf.id
    route {
        cidr_block = "0.0.0.0/0"  #adding rule
        gateway_id = aws_internet_gateway.my_igw_tf.id #pointing to igw
    }
    tags = {
      Name="tf-route-table"
    }
} 