resource "circleci_context" "app-context" {
  name  = "${var.AWS_RESOURCE_NAME_PREFIX}"
}

resource "circleci_context_environment_variable" "app-context-env" {
  depends_on = [
    aws_ecr_repository.app_repo
  ]

  for_each = {
    AWS_RESOURCE_NAME_PREFIX = "${var.AWS_RESOURCE_NAME_PREFIX}"
    AWS_ECR_REPOSITORY_URL = "${aws_ecr_repository.app_repo.registry_id}.dkr.ecr.${var.AWS_REGION}.amazonaws.com"
    AWS_ECR_REPOSITORY_REGISTRY_ID = "${aws_ecr_repository.app_repo.registry_id}"
  }

  variable   = each.key
  value      = each.value
  context_id = circleci_context.app-context.id
}