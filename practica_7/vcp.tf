resource "aws_vpc" "vpc_virgina" {
    cidr_block = var.virginia_cider
    #cidr_block =  lookup(var.virginia.cidr, terraform.workspace
    tags = {
        Name = "VPC Virginia-${local.sufix}"
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
        Name = "Private subnetl${local.sufix}"
    }
    depends_on = [ 
        aws_subnet.public_subnet_virginia
     ]
}
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc_virgina.id
    tags = {
        Name = "Internet Gateway${local.sufix}"
    }
  
}


  
resource "aws_route_table" "public_crt" {
    vpc_id = aws_vpc.vpc_virgina.id
    route  {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    
    tags = {
        Name = "Public Route Table${local.sufix}"
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

    dynamic "ingress" {
        for_each = var.ingress_port_list
        content {
            from_port = ingress.value
            to_port = ingress.value
            protocol = "tcp"
            cidr_blocks = [
                var.sg_ingress_cidr
            ]
        }
      
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
        Name = "Public Security Group${local.sufix}"
    }
  
}
