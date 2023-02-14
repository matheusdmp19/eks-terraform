resource "aws_eks_cluster" "eks_cluster" {

    name = var.cluster_name
    version = var.k8s_version
    role_arn = aws_iam_role.eks_cluster_role.id

    vpc_config {
      security_group_ids = [
        aws_security_group.eks-master-sg.id
      ]

      subnet_ids = [
        var.private_subnet_1a.id,
        var.private_subnet_1c.id
      ]
    }

    tags = {
      Name = "${var.cluster_name}"
    }
}
