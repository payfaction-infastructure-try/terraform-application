provider "aws" {
  access_key = "${var.AWS_ACCESS_KEY_ID}"
  secret_key = "${var.AWS_SECRET_ACCESS_KEY}"
  region     = "${var.AWS_REGION}"
}

provider "circleci" {
  api_token    = "${var.CIRCLECI_API_TOKEN}"
  organization = "${var.CIRCLECI_ORGANIZATION}"
  vcs_type     = "${var.CIRCLECI_VCS_TYPE}"
}

data "terraform_remote_state" "main_infrastructure" {
  backend = "remote"
  config = {
    organization = "${var.REMOTE_ORGANIZATION}"
    workspaces = {
      name = "${var.REMOTE_WORKSPACE}"
    }
  }
}
