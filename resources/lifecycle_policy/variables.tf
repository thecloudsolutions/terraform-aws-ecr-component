variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "repository" {
  type        = string
  description = "(Required) Name of the repository to apply the policy."
}

variable "policy" {
  type        = string
  description = "(Required) The policy document. This is a JSON formatted string.Consider using the aws_ecr_lifecycle_policy_document data_source to generate/manage the JSON document used for the policy argument."
}
