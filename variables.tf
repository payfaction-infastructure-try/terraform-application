variable "AWS_ACCESS_KEY_ID" {
  description = "AWS access key id"
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "AWS secret access key"
}

variable "AWS_REGION" {
  description = "AWS region e.g. us-east-1 (Please specify a region supported by the Fargate launch type)"
}

variable "AWS_RESOURCE_NAME_PREFIX" {
  description = "Should be named as image name in ecr repository. Prefix to be used in the naming of some of the created AWS resources e.g. demo-webapp"
}

variable "REMOTE_ORGANIZATION" {
  description = "Organization name which remote state should be used"
}

variable "REMOTE_WORKSPACE" {
  description = "Workspace name which remote state should be used"
}

variable "CIRCLECI_API_TOKEN" {
  description = "API token for using circleci"
}

variable "CIRCLECI_VCS_TYPE" {
  description = "Circleci vsc type"
  default     = "github"
}

variable "CIRCLECI_ORGANIZATION" {
  description = "Circleci organization"
}

variable "APPLICATION_COUNT" {
  description = "How many applications should be running"
  default     = 2
}


variable "SHOULD_USE_DEFAULT_TARGET_GROUP" {
  description = "Should default target group be used"
  default     = false
  type        = bool
}

# variable "SHOULD_CREATE_LISTENER_RULE" {
#   description = "Should a new listener rule be created"
#   default     = true
#   type        = bool
# }


variable "LISTENER_RULE_CONDITIONS" {
  description = "Should a new listener be created"

  type        = list(object({
    field  = string
    values = list(string)
  }))

  default     = [
    {
      field = "host_header",
      values = ["example.com"],
    },
    {
      field = "path_pattern",
      values = ["/static/*"],
    }
  ]
}
