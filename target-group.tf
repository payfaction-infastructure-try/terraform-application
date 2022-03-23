resource "aws_lb_target_group" "app_tg" {
  count       = var.SHOULD_USE_DEFAULT_TARGET_GROUP ? 0 : 1

  name        = "${local.aws_alb_target_group_name}"
  vpc_id      = local.vpc_id
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
}