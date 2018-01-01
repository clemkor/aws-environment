data "aws_availability_zones" "all" {}

module "network" {
  source = "infrablocks/base-networking/aws"
  version = "0.1.24"

  region = "${var.region}"
  vpc_cidr = "${var.vpc_cidr}"
  availability_zones = "${join(",", data.aws_availability_zones.all.names)}"

  component = "${var.component}"
  deployment_identifier = "${var.deployment_identifier}"

  private_zone_id = "${data.terraform_remote_state.common.private_dns_zone_id}"

  include_lifecycle_events = "no"
}