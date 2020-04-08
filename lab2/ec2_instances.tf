resource "aws_instance" "nginx1" {
  ami = "ami-0c322300a1dd5dc79"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.publicsubnet1.id
  key_name = aws_key_pair.ec2_key_pair.key_name
  tags = {
    Name = "nginx_ec2"
  }
  vpc_security_group_ids = [aws_security_group.ec2_public_subnet_sg.id]
}

resource "aws_instance" "nginx2" {
  ami = "ami-0c322300a1dd5dc79"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.publicsubnet2.id
  key_name = aws_key_pair.ec2_key_pair.key_name
  tags = {
    Name = "nginx2_ec2"
  }
  vpc_security_group_ids = [aws_security_group.ec2_public_subnet_sg.id]
}


resource "aws_instance" "bastion" {
  ami = "ami-0c322300a1dd5dc79"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.publicsubnet1.id
  key_name = aws_key_pair.ec2_key_pair.key_name
  tags = {
    Name = "bastion_ec2"
  }
  vpc_security_group_ids = [aws_security_group.ec2_bastion_sg.id]
}

output "nginx1_ec2_public_ip" {
  value = aws_instance.nginx1.public_ip
}

output "nginx2_ec2_public_ip" {
  value = aws_instance.nginx2.public_ip
}

output "bastion_ec2_public_ip" {
  value = aws_instance.bastion.public_ip
}

//-------------------------------------------------------------------------------------

resource "aws_instance" "gocd" {
  ami = "ami-0c322300a1dd5dc79"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.publicsubnet1.id
  key_name = aws_key_pair.ec2_key_pair.key_name
  tags = {
    Name = "gocd_ec2"
  }
  vpc_security_group_ids = [aws_security_group.ec2_private_subnet_sg.id]
}

resource "aws_instance" "nexus" {
  ami = "ami-0c322300a1dd5dc79"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.privatesubnet1.id
  key_name = aws_key_pair.ec2_key_pair.key_name
  tags = {
    Name = "nexus_ec2"
  }
  vpc_security_group_ids = [aws_security_group.ec2_private_subnet_sg.id]
}

output "gocd_ec2_private_ip" {
  value = aws_instance.gocd.private_ip
}
output "gocd_ec2_public_ip" {
  value = aws_instance.nexus.public_ip
}

output "nexus_ec2_private_ip" {
  value = aws_instance.nexus.private_ip
}
output "nexus_ec2_public_ip" {
  value = aws_instance.nexus.public_ip
}