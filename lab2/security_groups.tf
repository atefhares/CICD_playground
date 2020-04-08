resource "aws_security_group" "ec2_public_sg" {
  name = "public_ec2_sg"
  description = "sg for ec2 machines in the public subnet"
  vpc_id = aws_vpc.mainvpc.id
  tags = {
    Name = "public_ec2_sg"
  }
}

resource "aws_security_group_rule" "ingress_public_ssh_sgr" {
  from_port = 22
  to_port = 22
  protocol = "tcp"
  type = "ingress"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2_public_sg.id
}

resource "aws_security_group_rule" "ingress_public_http_sgr" {
  from_port = 80
  to_port = 80
  protocol = "tcp"
  type = "ingress"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2_public_sg.id
}

resource "aws_security_group_rule" "egress_public_all_tcp_sgr" {
  from_port = 0
  to_port = 65535
  protocol = "tcp"
  type = "egress"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2_public_sg.id
}
