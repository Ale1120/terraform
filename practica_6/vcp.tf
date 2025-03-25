resource "aws_vpc" "vpc_virgina" {
    cidr_block = var.virginia_cider
    tags = {
        Name = "VPC Virginia"
    }

  
}
resource "aws_subnet" "public_subnet_virginia" {
    vpc_id = aws_vpc.vpc_virgina.id
    cidr_block = var.subnets[0]
    map_public_ip_on_launch = true
    tags = {
        Name = "Public subnet_cambio en un recurso con terraform --target (aws_subnet.public_subent_virginia)name recurso"
    }
    
}

resource "aws_subnet" "private_subnet_virginia" {
    vpc_id = aws_vpc.vpc_virgina.id
    cidr_block = var.subnets[1] 
    tags = {
        Name = "Private subnetl"
    }
    depends_on = [ 
        aws_subnet.public_subnet_virginia
     ]
}

