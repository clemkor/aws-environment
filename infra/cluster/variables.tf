variable "region" {}
variable "private_network_cidr" {}

variable "component" {}
variable "deployment_identifier" {}

variable "cluster_instance_type" {}

variable "cluster_instance_ssh_public_key_path" {}

variable "cluster_minimum_size" {}
variable "cluster_maximum_size" {}
variable "cluster_desired_capacity" {}

variable "cluster_instance_root_block_device_size" {}
variable "cluster_instance_docker_block_device_size" {}

variable "network_state_bucket_name" {}
variable "network_state_key" {}