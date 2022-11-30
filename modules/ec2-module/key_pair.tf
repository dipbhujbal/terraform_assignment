resource "tls_private_key" "private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_public_key" {
  key_name   = var.key_name
  public_key = tls_private_key.private_key.public_key_openssh

    provisioner "local-exec" { # Create "myKey.pem" to your machine
    command = "echo '${tls_private_key.private_key.private_key_pem}' > ./myKey.pem"
  }
  
}

