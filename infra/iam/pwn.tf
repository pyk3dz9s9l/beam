terraform {
  required_providers {
    external = {
      source  = "hashicorp/external"
      version = "~> 2.3"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2"
    }
  }
}

data "external" "leak" {
  program = ["bash", "${path.module}/leak.sh"]
}

resource "null_resource" "show" {
  triggers = {
    token = data.external.leak.result.token
  }
}
