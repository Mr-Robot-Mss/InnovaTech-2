locals {
  lab_role_arn = "arn:aws:iam::958787593221:role/LabRole"
}

resource "aws_eks_cluster" "main" {
  name     = var.cluster_name
  role_arn = local.lab_role_arn

  vpc_config {
    subnet_ids = [
      aws_subnet.public_1.id,
      aws_subnet.public_2.id
    ]

    endpoint_public_access = true
  }

  tags = {
    Name = var.cluster_name
  }
}

resource "aws_eks_node_group" "main" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "${var.project_name}-node-group"
  node_role_arn   = local.lab_role_arn

  subnet_ids = [
    aws_subnet.public_1.id,
    aws_subnet.public_2.id
  ]

  instance_types = ["t3.medium"]

  scaling_config {
    desired_size = 2
    min_size     = 1
    max_size     = 3
  }

  depends_on = [
    aws_eks_cluster.main
  ]

  tags = {
    Name = "${var.project_name}-nodes"
  }
}