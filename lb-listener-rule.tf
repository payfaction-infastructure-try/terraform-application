resource "aws_lb_listener_rule" "app_listener_rule" {
  count        = var.SHOULD_USE_DEFAULT_TARGET_GROUP ? 0 : 1

  listener_arn = local.lb_listener.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_tg[0].arn
  }

  condition {
    dynamic "host_header" {
      for_each = { for i in var.LISTENER_RULE_CONDITIONS : i.field => i if i.field == "host-header" }
      content {
        values = host_header.value.values
      }
    }
    dynamic "path_pattern" {
      for_each = { for i in var.LISTENER_RULE_CONDITIONS : i.field => i if i.field == "path-pattern" }
      content {
        values = path_pattern.value.values
      }
    }
  }
}
