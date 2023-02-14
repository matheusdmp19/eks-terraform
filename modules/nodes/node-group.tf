resource "aws_eks_node_group" "node_group" {
  
  cluster_name = var.eks_cluster.name
  node_group_name = "${var.cluster_name}-node-group"
  node_role_arn = aws_iam_role.eks_nodes_role.arn

  subnet_ids = [
    var.private_subnet_1a.id,
    var.private_subnet_1c.id
  ]

  instance_types = var.nodes_instances_size

  scaling_config {
    desired_size = lookup(var.auto_scale_options, "desired")
    max_size = lookup(var.auto_scale_options, "max")
    min_size = lookup(var.auto_scale_options, "min")
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_worker_policy,
    aws_iam_role_policy_attachment.eks_cni_policy,
    aws_iam_role_policy_attachment.eks_ecr_policy,
  ]

  tags = {
    Name = "${var.cluster_name}-node-group"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}
