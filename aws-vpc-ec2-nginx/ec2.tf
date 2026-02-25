resource "aws_instance" "nginx_server" {
   ami  = "ami-073130f74f5ffb161" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type = "t3.micro"           # Updated to Free Tier eligible instance
  subnet_id     = aws_subnet.public_subnet_tf.id
  
  tags = {
    Name = "nginx-server"
  }
}