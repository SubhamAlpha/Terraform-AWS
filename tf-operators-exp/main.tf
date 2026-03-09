terraform  { }

#number list variable
variable "num_list" {
  type = list(number)
  default = [ 1,2,3,4,5 ]
}

#list of objects variable
variable "obj_list" {
  type = list(object({
    name = string
    age  = number
  }))
  default = [
    {
      name = "Alice"
      age  = 30
    },
    {
      name = "Bob"
      age  = 25
    }
  ]
}

#map variable
variable "map_var" {
  type = map(number)
  default = {
    key1 = 1
    key2 = 2
  }
}

#local variable using for loop to create a list of squares
locals {
    add=2+2
    mult=2*2
    div=10/2
    squares = [for num in var.num_list : num * num]
}

output "local_add" {
  value = local.add

}