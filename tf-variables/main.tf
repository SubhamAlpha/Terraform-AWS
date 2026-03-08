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

resource "aws_instance" "myserver" {
    
  ami  = "ami-0aaa636894689fa47" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type = var.aws_instance_type

  tags = {
    Name= "tf-instance-var"
  }

  root_block_device {
    delete_on_termination = true
    volume_size           = var.volumn_size
    volume_type           = "gp2"
  }
}