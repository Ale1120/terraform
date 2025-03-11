resource "aws_s3_bucket" "proveedproores" {
    count = 6
    bucket = "proaleo-${random_string.sufijo[count.index].id}"
    tags = {
        Owner = "Aleo"
        Environment = "Dev"
        Office = "proveedor"
    }
  
}

resource "random_string" "sufijo" {
    count = 6
    length =  8
    special = false
    upper = false
    numeric = false
}