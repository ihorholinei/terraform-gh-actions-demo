terraform {
  required_version = ">= 1.3.0"
}

provider "null" {}

resource "null_resource" "test" {
  provisioner "local-exec" {
    command = "echo GitHub Action works!"
  }
}