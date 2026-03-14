variable "vpc_config" {
  description = "VPC configuration"
  type = object({
    cidr_block = string
    Name =string

  })
  validation {
    condition = can(cidrnetmask(var.vpc_config.cidr_block))
    error_message = "Invalid CIDR format - ${var.vpc_config.cidr_block}"
  }
}

variable "subnet-config" {
  type = map(object({
    cidr_block = string
    az= string

  }))
  
}