resource "aws_security_group" "ec2_public_subnet_sg" {
  name = "public_ec2_sg"
  description = "sg for ec2 machines in the public subnet"
  vpc_id = aws_vpc.mainvpc.id
  tags = {
    Name = "public_ec2_sg"
  }
}

resource "aws_security_group_rule" "ingress_public_subnet_ssh_sgr" {
  from_port = 22
  to_port = 22
  protocol = "tcp"
  type = "ingress"
  cidr_blocks = [aws_vpc.mainvpc.cidr_block]
  security_group_id = aws_security_group.ec2_public_subnet_sg.id
}

resource "aws_security_group_rule" "ingress_public_subnet_http_sgr" {
  from_port = 80
  to_port = 80
  protocol = "tcp"
  type = "ingress"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2_public_subnet_sg.id
}

resource "aws_security_group_rule" "egress_public_subnet_all_tcp_sgr" {
  from_port = 0
  to_port = 65535
  protocol = "tcp"
  type = "egress"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2_public_subnet_sg.id
}

//--------------------------------------------------------------------------------------------------------

resource "aws_security_group" "ec2_bastion_sg" {
  name = "bastion_ec2_sg"
  description = "sg for bastion ec2 machine in the public subnet"
  vpc_id = aws_vpc.mainvpc.id
  tags = {
    Name = "bastion_ec2_sg"
  }
}

resource "aws_security_group_rule" "ingress_bastion_sg_ssh_sgr" {
  from_port = 22
  to_port = 22
  protocol = "tcp"
  type = "ingress"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2_bastion_sg.id
}

//--------------------------------------------------------------------------------------------------------

resource "aws_security_group" "ec2_private_subnet_sg" {
  name = "private_ec2_sg"
  description = "sg for ec2 machines in the private subnet"
  vpc_id = aws_vpc.mainvpc.id
  tags = {
    Name = "private_ec2_sg"
  }
}

resource "aws_security_group_rule" "ingress_private_subnet_ssh_sgr" {
  from_port = 22
  to_port = 22
  protocol = "tcp"
  type = "ingress"
  cidr_blocks = [aws_vpc.mainvpc.cidr_block]
  security_group_id = aws_security_group.ec2_private_subnet_sg.id
}