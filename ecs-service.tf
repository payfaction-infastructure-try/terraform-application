resource "aws_ecs_service" "app_ecs_service" {
  name            = "${local.aws_ecs_service_name}"
  cluster         = local.cluster_id
  task_definition = aws_ecs_task_definition.app_task_def.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets         = local.private_subnets
    security_groups = [aws_security_group.app_sg.id]
  }

  load_balancer {
    target_group_arn = var.SHOULD_USE_DEFAULT_TARGET_GROUP ? local.lb_default_target_group.arn : aws_lb_target_group.app_tg[0].arn
    container_name   = "${local.aws_ecs_service_name}"
    container_port   = 80
  }

  depends_on = [local.lb_listener]
}

