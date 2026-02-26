resource "aws_instance" "nginx_server" {
   ami  = "ami-073130f74f5ffb161" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type = "t3.micro"           # Updated to Free Tier eligible instance
  subnet_id     = aws_subnet.public_subnet_tf.id
  security_groups = [aws_security_group.ngnix_sg.id]
  associate_public_ip_address = true 
  
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo amazon-linux-extras install nginx1.12 -y
              sudo systemctl start nginx
              sudo systemctl enable nginx
              EOF
  tags = {
    Name = "nginx-server"
  }
}