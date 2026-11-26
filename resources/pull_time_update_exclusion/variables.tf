variable "principal_arn" {
  type        = string
  description = "(Required, Forces new resource) ARN of the IAM principal excluded from image pull-time updates."
}

variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}
