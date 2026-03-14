resource "aws_vpc" "main" {
  cidr_block = var.vpc_config.cidr_block
  tags = {
    Name = var.vpc_config.Name
  }
}

resource "aws_subnet" "subnet-mod" {
  vpc_id = aws_vpc.main.id
  for_each = var.subnet-config
  cidr_block = each.value.cidr_block
  availability_zone = each.value.az
  
}