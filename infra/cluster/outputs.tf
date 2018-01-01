output "cluster_id" {
  value = "${module.ecs_cluster.cluster_id}"
}
output "service_role_arn" {
  value = "${module.ecs_cluster.service_role_arn}"
}
output "security_group_id" {
  value = "${module.ecs_cluster.security_group_id}"
}
