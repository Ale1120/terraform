resource "aws_vpc" "vpc_virgina" {
    cidr_block = var.virginia_cider
    tags = {
        Name = "VPC_VIRGINA"
        Environment = "Dev"
    }
  
}

resource "aws_vpc" "vpc_ohio" {
    cidr_block = var.ohio_cider
    tags = {
        Name = "VPC_OHIO"
        Environment = "Dev"
    }
    provider = aws.ohaio
  
}