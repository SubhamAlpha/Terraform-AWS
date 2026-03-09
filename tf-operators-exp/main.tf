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