variable "vpc-config" {
  description = "VPC configuration"
  type = object({
    cidr_block = string
    Name =string

  })
}