module "vpc-module" {
  source = "./module/vpc"
    vpc_config = {
        cidr_block = "10.0.0.0/16"
        Name = "MyVPC"
    }
}