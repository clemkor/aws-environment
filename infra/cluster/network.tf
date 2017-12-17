data "terraform_remote_state" "network" {
  backend = "s3"

  config {
    bucket = "${var.network_state_bucket_name}"
    key = "${var.network_state_key}"
    region = "${var.region}"
    encrypt = "true"
  }
}