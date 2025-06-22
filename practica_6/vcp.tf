resource "aws_vpc" "vpc_virgina" {
    cidr_block = var.virginia_cider
    #cidr_block =  lookup(var.virginia.cidr, terraform.workspace
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
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc_virgina.id
    tags = {
        Name = "Internet Gateway"
    }
  
}


  
resource "aws_route_table" "public_crt" {
    vpc_id = aws_vpc.vpc_virgina.id
    route  {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    
    tags = {
        Name = "Public Route Table"
    }
}

resource "aws_route_table_association" "crta_public" {
    subnet_id = aws_subnet.public_subnet_virginia.id
    route_table_id = aws_route_table.public_crt.id
  
}


resource "aws_security_group" "sg_public_instance" {
    name = "Public Security Group"
    vpc_id = aws_vpc.vpc_virgina.id
    description = "Allow HTTP and SSH inbound traffic"

    ingress {
        description = "Allow HTTP inbound traffic"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [
            var.sg_ingress_cidr
        ]
    }

     egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [
            var.sg_ingress_cidr
        ]
     }
    tags = {
        Name = "Public Security Group"
    }
  
}
