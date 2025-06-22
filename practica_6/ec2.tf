resource "aws_instance" "public_instance" {
    ami = var.ec2_specs.ami
    instance_type = var.ec2_specs.instance_type
    subnet_id = aws_subnet.public_subnet_virginia.id
    key_name = data.aws_key_pair.key.key_name
    vpc_security_group_ids = [
        aws_security_group.sg_public_instance.id
    ]
    user_data = file("user_data.sh")
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
    provisioner "remote-exec" {
        inline = [
            "echo 'hola mundo' > ~saludo.txt"
            ]
        connection {
            type = "ssh"
            user = "ec2-user"
            private_key = file("key.pem")
            host = self.public_ip
        }
      
    }
    # lifecycle {
    #   replace_triggered_by = [ 
    #     aws_subnet.private_subnet_virginia.id 
    #      ]
    # }
}
# import
# resource "aws_instance" "mywebserver" {
#     ami                                  = "ami-09e6f87a47903347c"
#     instance_type                        = "t2.micro"
#     key_name                             = data.aws_key_pair.key.key_name
#     subnet_id                            = aws_subnet.public_subnet_virginia.id
#     tags                                 = {
#         "Name" = "test"
#     }
#     vpc_security_group_ids               = [
#         aws_security_group.sg_public_instance.id
#     ]

# }