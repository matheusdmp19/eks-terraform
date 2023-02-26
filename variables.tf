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

variable "auto_scale_cpu" {
  default = {
    scale_up_threshold  = 80
    scale_up_period     = 60
    scale_up_evaluation = 2
    scale_up_cooldown   = 300
    scale_up_add        = 2

    scale_down_threshold  = 40
    scale_down_period     = 60
    scale_down_evaluation = 2
    scale_down_cooldown   = 300
    scale_down_remove     = -1
  }
}
