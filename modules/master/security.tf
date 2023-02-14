resource "aws_security_group" "eks-master-sg" {
  
  name = "${var.cluster_name}-eks-master-sg"
  vpc_id = var.cluster_vpc.id

  egress {
    from_port = 0
    to_port = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.cluster_name}-eks-master-sg"
  }
}

resource "aws_security_group_rule" "cluster_ingress_https" {

  # Enter ip/interval for public api access. It is not recommended to leave open access to the internet.
  cidr_blocks = ["0.0.0.0/0"]
  from_port = 443
  to_port = 443
  protocol = "tcp"

  security_group_id = aws_security_group.eks-master-sg.id

  type = "ingress"
}
