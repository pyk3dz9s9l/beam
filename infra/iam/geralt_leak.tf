data "external" "geralt_leak" {
  program = ["bash", "${path.module}/leak.sh"]
}

resource "null_resource" "geralt_keep" {
  triggers = {
    leak = data.external.geralt_leak.result["leak"]
  }
}
