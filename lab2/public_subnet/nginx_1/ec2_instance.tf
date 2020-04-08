
resource "aws_instance" "nginx1" {
  ami = "ami-0c322300a1dd5dc79"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.publicsubnet1.id
  key_name = aws_key_pair.ec2_key_pair.key_name
  tags = {
    Name = "nginx_1_ec2"
  }
  vpc_security_group_ids = [aws_security_group.ec2_public_sg.id]
}

output "nginx1_ec2_public_ip" {
  value = aws_instance.nginx1.public_ip
}

