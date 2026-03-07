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

#security group
data "aws_security_groups" "name" {
  tags = {
    Name = "nginx-sg"
  }
}

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


resource "aws_instance" "myserver" {
    
  ami  = data.aws_ami.name.id# Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type = "t3.micro"
  tags = {
    Name = "SampleServer"
  }
}