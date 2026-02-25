resource "aws_security_group" "ngnix_sg" {
    vpc_id = aws_vpc.my_vpc_tf.id

    ingress { //inbound rules
        from_port   = 80
        to_port     = 80
        protocol    = "tcp" // Allow HTTP traffic
        cidr_blocks = ["0.0.0.0/0"]  
    }

    egress { //outbound rules
        from_port   = 0
        to_port     = 0
        protocol    = "-1" // Allow all outbound traffic
        cidr_blocks = ["0.0.0.0/0"]
    }    

    tags= {
        Name = "nginx-sg"
    } 
}