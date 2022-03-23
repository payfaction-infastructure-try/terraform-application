resource "circleci_context" "app-context" {
  name  = "${var.AWS_RESOURCE_NAME_PREFIX}"
}

resource "circleci_context_environment_variable" "app-context-env" {
  for_each = {
    AWS_RESOURCE_NAME_PREFIX = "${var.AWS_RESOURCE_NAME_PREFIX}"
    AWS_ECR_REPOSITORY_URL = "${module.app_infrastructure.aws_ecr_repository.registry_id}.dkr.ecr.${var.AWS_REGION}.amazonaws.com"
    AWS_ECR_REPOSITORY_REGISTRY_ID = "${module.app_infrastructure.aws_ecr_repository.registry_id}"
  }

  variable   = each.key
  value      = each.value
  context_id = circleci_context.app-context.id
}