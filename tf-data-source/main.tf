terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-north-1"
}

#ami
data "aws_ami" "name" {
  most_recent = true
  owners = [ "amazon" ]
}
output "aws_ami" {
    value = data.aws_ami.name
}

# #security group
# data "aws_security_groups" "name" {
#   tags = {
#     Name = "nginx-sg"
#   }
# }

#caller identity
data "aws_caller_identity" "name" {
  
}
output "callerinfo" {
  value = data.aws_caller_identity.name
}

#region
data "aws_region" "name" {
  
}
output "region" {
  value = data.aws_region.name
}

#VPC
data "aws_vpc" "name" {
  tags = {
    "Name" = "tf-vpc"
  }
}
output "vpc" {
  value = data.aws_vpc.name
}

#subnet
data "aws_subnet" "name" {
  filter {
    name = "vpc-id"
    values = [ data.aws_vpc.name.id]
  }
  tags = {
    "Name" = "tf-public-subnet"
  }
}

#security group with filter
data "aws_security_groups" "name" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.name.id]
  }
  tags = {
    Name = "nginx-sg"
  }
}
output "subnet" {
  value = data.aws_subnet.name
}



resource "aws_instance" "myserver" {
    
  ami  = "ami-0aaa636894689fa47" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type = "t3.micro"
  subnet_id = data.aws_subnet.name.id
  security_groups = data.aws_security_groups.name.ids

  tags = {
    Name = "dynamicServer"
  }
}