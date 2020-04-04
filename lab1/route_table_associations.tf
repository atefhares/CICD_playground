resource "aws_route_table_association" "rt_association_public1" {
    subnet_id = "${aws_subnet.publicsubnet1.id}"
    route_table_id = "${aws_route_table.public_rt.id}"
}

resource "aws_route_table_association" "rt_association_public2" {
    subnet_id = "${aws_subnet.publicsubnet2.id}"
    route_table_id = "${aws_route_table.public_rt.id}"
}



resource "aws_route_table_association" "rt_association_private1" {
    subnet_id = "${aws_subnet.privatesubnet1.id}"
    route_table_id = "${aws_route_table.private_rt.id}"
}

resource "aws_route_table_association" "rt_association_private2" {
    subnet_id = "${aws_subnet.privatesubnet2.id}"
    route_table_id = "${aws_route_table.private_rt.id}"
}
