variable "credential_arn" {
  type        = string
  default     = null
  description = "(Optional) ARN of the Secret which will be used to authenticate against the registry."
}

variable "custom_role_arn" {
  type        = string
  default     = null
  description = "(Optional) ARN of the IAM role associated with the pull through cache rule. Required when the upstream registry is a cross-account ECR private registry."
}

variable "ecr_repository_prefix" {
  type        = string
  description = "(Required, Forces new resource) The repository name prefix to use when caching images from the source registry."
}

variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "upstream_registry_url" {
  type        = string
  description = "(Required, Forces new resource) The registry URL of the upstream registry to use as the source."
}

variable "upstream_repository_prefix" {
  type        = string
  default     = null
  description = "(Optional, Forces new resource) Upstream repository prefix associated with the pull through cache rule. Defaults to ROOT."
}
