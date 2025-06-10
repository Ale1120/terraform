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

variable "sg_ingress_cidr" {
    description = "value for the ingress rule"
    type = string
    
  
}
variable "ec2_specs" {
    description = "EC2 instance specifications"
    type = map(string)
    
  
}