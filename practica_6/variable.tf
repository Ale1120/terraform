variable "virginia_cider" {  
    description = "Cider block for the Virginia VPC"
   type = string
    sensitive = true

} 

# variable "public_subnet" {  
#     description = "Cider public for the Virginia VPC"
#     type = string
#     sensitive = true

# } 

# variable "private_subnet" {  
#     description = "Cider private for the Virginia VPC"
#     type = string
#     sensitive = true

# }

variable "subnets" {
    description = "lista de subnets"
    type = list(string)
}

variable "tags" {
    description = "tags for the resources"
    type = map(string)
  
}