resource "aws_lb_listener_rule" "app_listener_rule" {
  count        = var.SHOULD_USE_DEFAULT_TARGET_GROUP ? 0 : 1

  listener_arn = local.lb_listener.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_tg.arn
  }

  condition {
    dynamic "host_header" {
      for_each = { for i in LISTENER_RULE_CONDITIONS.service_alb_rules : i.field => i if i.field == "host-header" }
      content {
        values = [host_header.value.value]
      }
    }
    dynamic "path_pattern" {
      for_each = { for i in LISTENER_RULE_CONDITIONS.service_alb_rules : i.field => i if i.field == "path-pattern" }
      content {
        values = [path_pattern.value.value]
      }
    }
  }
}
