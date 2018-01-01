module "ecs_cluster" {
  source = "infrablocks/ecs-cluster/aws"
  version = "0.2.6"

  region = "${var.region}"
  vpc_id = "${data.terraform_remote_state.network.vpc_id}"
  subnet_ids = "${data.terraform_remote_state.network.public_subnet_ids}"

  component = "${var.component}"
  deployment_identifier = "${var.deployment_identifier}"

  cluster_instance_ssh_public_key_path = "${var.cluster_instance_ssh_public_key_path}"
  cluster_instance_type = "${var.cluster_instance_type}"

  cluster_minimum_size = "${var.cluster_minimum_size}"
  cluster_maximum_size = "${var.cluster_maximum_size}"
  cluster_desired_capacity = "${var.cluster_desired_capacity}"

  cluster_instance_root_block_device_size = "${var.cluster_instance_root_block_device_size}"
  cluster_instance_docker_block_device_size = "${var.cluster_instance_docker_block_device_size}"

  associate_public_ip_addresses = "${var.associate_public_ip_addresses}"
  include_default_ingress_rule = "${var.include_default_ingress_rule}"
}
