module "vpc-module" {
  source = "./module/vpc"
    vpc_config = {
        cidr_block = "10.0.0.0/16"
        Name = "MyVPC"
    }

    subnet-config = {
        public-subnet = {
            cidr_block = "10.0.0.0/24"
            az = "eu-north-1a"
        }
        private-subnet = {
            cidr_block = "10.0.1.0/24"
            az = "eu-north-1b"
        }
    }     
}