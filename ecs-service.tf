resource "aws_ecs_service" "app_ecs_service" {
  name            = "${local.aws_ecs_service_name}"
  cluster         = var.cluster_id
  task_definition = aws_ecs_task_definition.app_task_def.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets         = locals.private_subnets
    security_groups = [aws_security_group.app_sg.id]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.app_tg.id
    container_name   = "${local.aws_ecs_service_name}"
    container_port   = 80
  }

  depends_on = [locals.lb_listener]
}

