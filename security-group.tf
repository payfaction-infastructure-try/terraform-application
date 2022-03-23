resource "aws_security_group" "app_sg" {
  name        = "${local.aws_ecs_service_security_group_name}"
  vpc_id      = local.vpc_id

  ingress {
    protocol        = "tcp"
    from_port       = 80
    to_port         = 80
    security_groups = [local.lb_security_group_id]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}