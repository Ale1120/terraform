variable "virginia_cider" {  
    description = "Cider block for the Virginia VPC"
    type = string
    # teype = map(string)
    sensitive = true

} 

variable "instancia" {  
    description = "EC2 instance specifications"
    # type = list(string)
    type = set(string)
    
  
}

variable "enable_monitoring" {
    description = "Enable monitoring for the EC2 instances"
    type = bool
  
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

variable "ingress_port_list" {
    description = "List of ingress ports for the security group"
    type = list(number)
  
}