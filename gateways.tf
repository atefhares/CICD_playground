resource "aws_internet_gateway" "maingateway" {
  vpc_id = aws_vpc.mainvpc.id

  tags = {
    Name = "maingateway"
  }
}
