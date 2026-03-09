terraform {}

locals {
  value="Hello World"
}

variable "string_list" {
  type = list(string)
  default = [ "Ram", "Shyam", "Mohan" ]
}


output "value" {
  value = lower(local.value)
}

output "string_list" {
  #value = [ for i in var.string_list : upper(i) ]
  #value = split(" ",local.value)
  #value = abs(-5)
  #value = length(var.string_list)
  value = join(", ", var.string_list)
}