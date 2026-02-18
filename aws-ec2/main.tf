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

resource "aws_instance" "myserver01" {
    
  ami  = "ami-073130f74f5ffb161" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type = "t3.micro"
  tags = {
    Name = "myserver01"
  }
}