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
  description = " (Required) The policy document. This is a JSON formatted string. For more information about building IAM policy documents with Terraform"
}
