resource "aws_instance" "nginx_server" {
   ami  = "ami-073130f74f5ffb161" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type = "t3.micro"           # Updated to Free Tier eligible instance
  subnet_id     = aws_subnet.public_subnet_tf.id
  vpc_security_group_ids = [aws_security_group.ngnix_sg.id] # Associate security group
  associate_public_ip_address = true 
  
user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras enable nginx1
              yum clean metadata
              yum install -y nginx
              systemctl start nginx
              systemctl enable nginx
              EOF
              
  tags = {
    Name = "nginx-server"
  }
}