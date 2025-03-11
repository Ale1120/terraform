resource "local_file" "productos" {
  content  = "lista de productos para el proximo mes"
  filename = "producto.txt"

}