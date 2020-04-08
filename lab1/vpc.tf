resource "aws_vpc" "mainvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "mainvpc"
  }
}


output "vpc" {
  value = aws_vpc.mainvpc.id
}