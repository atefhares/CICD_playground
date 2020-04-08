//local resource
resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits = "4096"

//  provisioner "local-exec" {
//    command = "echo ${tls_private_key.ec2_key.private_key_pem}"
//  }
}


// resource on aws
resource "aws_key_pair" "ec2_key_pair" {
  public_key = tls_private_key.ec2_key.public_key_openssh
}


//output "key_output" {
//  value = tls_private_key.ec2_key.private_key_pem
//}

resource "local_file" "ec2_private_key_file" {
  content     = tls_private_key.ec2_key.private_key_pem
  filename = "./private_key.pem"

  provisioner "local-exec" {
    command = "chmod 400 ./private_key.pem"
  }
}