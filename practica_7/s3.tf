resource "aws_s3_bucket" "cerberus_bucket" {
  bucket = local.sufix_s3
  
}