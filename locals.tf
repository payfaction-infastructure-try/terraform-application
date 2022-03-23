
locals {
  aws_ecr_repository_name             = "${var.AWS_RESOURCE_NAME_PREFIX}"
  aws_ecs_service_name                = "${var.AWS_RESOURCE_NAME_PREFIX}-service"
  aws_alb_target_group_name           = "${var.AWS_RESOURCE_NAME_PREFIX}-alb-target-group"
  aws_ecs_service_security_group_name = "${var.AWS_RESOURCE_NAME_PREFIX}-ecs-service-security-group"

  vpc_id                  = data.terraform_remote_state.main_infrastructure.outputs.vpc_id
  cluster_id              = data.terraform_remote_state.main_infrastructure.outputs.cluster_id
  lb_listener             = data.terraform_remote_state.main_infrastructure.outputs.lb_listener
  private_subnets         = data.terraform_remote_state.main_infrastructure.outputs.private_subnets
  load_balancer_ip        = data.terraform_remote_state.main_infrastructure.outputs.load_balancer_ip
  lb_default_target_group = data.terraform_remote_state.main_infrastructure.outputs.alb_default_target_group
  lb_security_group_id    = data.terraform_remote_state.main_infrastructure.outputs.load_balancer_security_group_id
}