resource "aws_subnet" "public_subnet_1a" {
  vpc_id = aws_vpc.cluster_vpc.id

  cidr_block = "10.0.0.0/22"
  map_public_ip_on_launch = true
  availability_zone = "${var.aws_region}a"

  tags = {
    Name = "${var.cluster_name}-public-1a"
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                    = true
  }
}

resource "aws_subnet" "public_subnet_1c" {
  vpc_id = aws_vpc.cluster_vpc.id

  cidr_block = "10.0.4.0/22"
  map_public_ip_on_launch = true
  availability_zone = "${var.aws_region}c"

  tags = {
    Name = "${var.cluster_name}-public-1c"
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                    = true
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.cluster_vpc.id

  tags = {
    Name = "${var.cluster_name}-public-route-table"
  }
}

resource "aws_route" "internet_route" {
  route_table_id = aws_route_table.public_route_table.id

  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public_1a" {
  subnet_id = aws_subnet.public_subnet_1a.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_1c" {
  subnet_id = aws_subnet.public_subnet_1c.id
  route_table_id = aws_route_table.public_route_table.id
}
