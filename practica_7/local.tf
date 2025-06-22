
locals {
  sufix = "${var.tags.project}-${var.tags.environment}-${var.tags.region}"
}

resource "random_string" "sufijo_s3" {
  length  = 8
  special = false
  upper   = false
  lower   = true
  numeric = true
  
}

locals {
  sufix_s3 = "${var.tags.project}-${random_string.sufijo_s3.id}"
}