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

data "aws_ami" "name" {
  most_recent = true
  owners = [ "amazon" ]
}
output "aws_ami" {
    value = data.aws_ami.name
}

resource "aws_instance" "myserver" {
    
  ami  = "ami-073130f74f5ffb161" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type = "t3.micro"
  tags = {
    Name = "SampleServer"
  }
}