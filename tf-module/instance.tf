module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "6.3.0"

  name = "my-ec2-instance"
  ami = "ami-0aaa636894689fa47" 
  instance_type = "t3.micro"
  subnet_id     = module.vpc.public_subnets[0]
  #vpc_security_group_ids = [data.aws_security_groups.name.ids[0]]   

  tags = {
    name  = "modules-ec2-instance"
    Environment = "dev"
  }
}

