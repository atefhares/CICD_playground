resource "aws_vpc" "mainvpc" {
  cidr_block = var.cidr
  tags = {
    Name = "mainvpc"
  }
}
