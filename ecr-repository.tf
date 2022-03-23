resource "aws_ecr_repository" "app_repo" {
  name = "${local.aws_ecr_repository_name}"

  image_scanning_configuration {
    scan_on_push = true
  }
}