data "aws_iam_role" "ecs_task_execution_role" {
  name = "ecsTaskExecutionRole"
}

resource "aws_ecs_task_definition" "app_task_def" {
  family                   = "${local.aws_ecs_service_name}"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 1024
  memory                   = 2048
  execution_role_arn       = "${data.aws_iam_role.ecs_task_execution_role.arn}"

  container_definitions = <<DEFINITION
    [
      {
        "essential": true,
        "image": "${aws_ecr_repository.app_repo.repository_url}",
        "cpu": 1024,
        "memory": 2048,
        "name": "${local.aws_ecs_service_name}",
        "networkMode": "awsvpc",
        "portMappings": [
          {
            "containerPort": 80,
            "hostPort": 80,
            "protocol" : "tcp"
          }
        ]
      }
    ]
    DEFINITION
}