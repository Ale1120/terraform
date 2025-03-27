resource "aws_instance" "public_instance" {
    ami = "ami-084568db4383264d4"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public_subnet_virginia.id
    key_name = data.aws_key_pair.key.key_name
    vpc_security_group_ids = [
        aws_security_group.sg_public_instance.id
    ]
    tags = {
        Name = "Ubuntu"
    }

    provisioner "local-exec" {
        command = "echo instancia creada con la IP ${aws_instance.public_instance.public_ip} >> ip_public_instance.txt"
      
    }
    provisioner "local-exec" {
        when = destroy
        command = "echo instancia eliminada con la IP ${self.public_ip} >> ip_public_instance.txt"
      
    }
    # lifecycle {
    #   replace_triggered_by = [ 
    #     aws_subnet.private_subnet_virginia.id 
    #      ]
    # }
}  