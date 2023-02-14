resource "aws_eip" "nat_gateway_eip_1a" {
  vpc = true

  tags = {
    Name = "${var.cluster_name}-ngtw-eip-1a"
  }
}

resource "aws_nat_gateway" "nat_gateway_1a" {
  allocation_id = aws_eip.nat_gateway_eip_1a.id
  subnet_id = aws_subnet.public_subnet_1a.id

  tags = {
    Name = "${var.cluster_name}-ngtw-1a"
  }
}

resource "aws_eip" "nat_gateway_eip_1c" {
  vpc = true

  tags = {
    Name = "${var.cluster_name}-ngtw-eip-1c"
  }
}

resource "aws_nat_gateway" "nat_gateway_1c" {
  allocation_id = aws_eip.nat_gateway_eip_1c.id
  subnet_id = aws_subnet.public_subnet_1c.id

  tags = {
    Name = "${var.cluster_name}-ngtw-1c"
  }
}
