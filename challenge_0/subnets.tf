resource "aws_subnet" "publicsubnet1" {
  vpc_id     = aws_vpc.mainvpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1a"
  tags = {
    Name = "publicsubnet1"
  }
}


resource "aws_subnet" "publicsubnet2" {
  vpc_id     = aws_vpc.mainvpc.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1b"
  tags = {
    Name = "publicsubnet2"
  }
}



resource "aws_subnet" "privatesubnet1" {
  vpc_id     = aws_vpc.mainvpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "privatesubnet1"
  }
}


resource "aws_subnet" "privatesubnet2" {
  vpc_id     = aws_vpc.mainvpc.id
  availability_zone = "us-east-1b"
  cidr_block = "10.0.4.0/24"
  tags = {
    Name = "privatesubnet2"
  }
}
