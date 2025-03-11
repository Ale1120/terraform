resource "aws_vpc" "vpc_virgina" {
    cidr_block = "10.10.0.0/16"
    tags = {
        Name = "VPC_VIRGINA"
        Environment = "Dev"
    }
  
}

resource "aws_vpc" "vpc_ohio" {
    cidr_block = "10.20.0.0/16"
    tags = {
        Name = "VPC_OHIO"
        Environment = "Dev"
    }
    provider = aws.ohaio
  
}