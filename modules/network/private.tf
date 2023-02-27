resource "aws_subnet" "private_subnet_1a" {
  vpc_id = aws_vpc.cluster_vpc.id

  cidr_block = "10.0.8.0/22"
  availability_zone = "${var.aws_region}a"

  tags = {
    Name = "${var.cluster_name}-private-1a"
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = 1
  }
}

resource "aws_subnet" "private_subnet_1c" {
  vpc_id = aws_vpc.cluster_vpc.id

  cidr_block = "10.0.12.0/22"
  availability_zone = "${var.aws_region}c"

  tags = {
    Name = "${var.cluster_name}-private-1c"
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = 1
  }
}

resource "aws_route_table" "private_route_table_1a" {
  vpc_id = aws_vpc.cluster_vpc.id

  tags = {
    Name = "${var.cluster_name}-private-rt-1a"
  }
}

resource "aws_route" "nat_route_1a" {
  route_table_id = aws_route_table.private_route_table_1a.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.nat_gateway_1a.id
}

resource "aws_route_table_association" "private_1a" {
  route_table_id = aws_route_table.private_route_table_1a.id
  subnet_id = aws_subnet.private_subnet_1a.id
}

resource "aws_route_table" "private_route_table_1c" {
  vpc_id = aws_vpc.cluster_vpc.id

  tags = {
    Name = "${var.cluster_name}-private-rt-1c"
  }
}

resource "aws_route" "nat_route_1c" {
  route_table_id = aws_route_table.private_route_table_1c.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.nat_gateway_1c.id
}

resource "aws_route_table_association" "private_1c" {
  route_table_id = aws_route_table.private_route_table_1c.id
  subnet_id = aws_subnet.private_subnet_1c.id
}
