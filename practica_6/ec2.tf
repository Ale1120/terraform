resource "aws_instance" "public_instance" {
    ami = "ami-084568db4383264d4"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public_subnet_virginia.id
    key_name = data.aws_key_pair.key.key_name
    tags = {
        Name = "Ubuntu"
    }
}