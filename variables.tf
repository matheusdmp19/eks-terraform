variable "cluster_name" {
  default = "k8s-terraform"
}

variable "aws_region" {
  default = "us-east-1"
}

variable "k8s_version" {
  default = "1.24"
}

variable "nodes_instances_size" {
  default = [
    "t3.medium"
  ]
}

variable "auto_scale_options" {
  default = {
    min     = 2
    max     = 5
    desired = 2
  }
}
