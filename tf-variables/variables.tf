variable "aws_instance_type" {
    description = "what type of instance you want to create?"
    type        = string 
    validation {
      condition =  var.aws_instance_type=="t2.micro"|| var.aws_instance_type=="t3.micro"
      error_message = "instance type must be t2.micro, t3.micro"
    }
    
  
}

variable "volumn_size" {
    description = "what size of volumn you want to create?"
    type        = number
    validation {
      condition =  var.volumn_size >= 8 && var.volumn_size <= 16
      error_message = "volumn size must be between 8 and 16"
    }
}