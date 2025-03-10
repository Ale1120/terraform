resource "local_file" "productos" {
    count = 5
    content = "lista de productos para el proximo mes"
    filename = "producto-${random_string.sufijo[count.index].id}.txt"
  
}
