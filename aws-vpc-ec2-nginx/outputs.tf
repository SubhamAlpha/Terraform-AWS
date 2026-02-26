output "instance_public_ip" {
    value = aws_instance.nginx_server.public_ip
    description = "Public ip of EC2 instance"
  
}

output "instance_url" {
    value = "http://${aws_instance.nginx_server.public_ip}"
    description = "URL of the nginx server"
  
}