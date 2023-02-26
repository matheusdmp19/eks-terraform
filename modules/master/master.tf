resource "aws_eks_cluster" "eks_cluster" {

    name = var.cluster_name
    version = var.k8s_version
    role_arn = aws_iam_role.eks_cluster_role.arn

    vpc_config {
      security_group_ids = [
        aws_security_group.eks-master-sg.id
      ]

      subnet_ids = [
        var.private_subnet_1a.id,
        var.private_subnet_1c.id
      ]
    }

    depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy,
    aws_iam_role_policy_attachment.eks-cluster-service
    ]

    tags = {
      Name = "${var.cluster_name}"
      "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    }
}
