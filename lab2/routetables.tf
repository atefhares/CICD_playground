resource "aws_route_table" "private_rt" {
    vpc_id = aws_vpc.mainvpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.maingateway.id
    }

    tags = {
        Name = "private_rt"
    }
}


resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.mainvpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.maingateway.id
    }

    tags =  {
        Name = "public_rt"
    }
}


