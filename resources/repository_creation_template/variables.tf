variable "applied_for" {
  type        = set(string)
  description = "(Required) Features this template applies to. Supports CREATE_ON_PUSH, PULL_THROUGH_CACHE, and REPLICATION."
}

variable "custom_role_arn" {
  type        = string
  default     = null
  description = "(Optional) ARN of the IAM role used for repository creation. Required when configuring repository tags or KMS encryption."
}

variable "description" {
  type        = string
  default     = null
  description = "(Optional) Description of the repository creation template."
}

variable "encryption_configuration" {
  type = object({
    encryption_type = optional(string)
    # (Optional) Encryption type for created repositories. Defaults to AES256.
    kms_key = optional(string)
    # (Optional) ARN of the KMS key used to encrypt created repositories.
  })
  default     = null
  description = "(Optional) Encryption configuration for created repositories."
}

variable "image_tag_mutability" {
  type        = string
  default     = null
  description = "(Optional) Tag mutability for created repositories. Supports MUTABLE, IMMUTABLE, IMMUTABLE_WITH_EXCLUSION, and MUTABLE_WITH_EXCLUSION. Defaults to MUTABLE."
}

variable "image_tag_mutability_exclusion_filter" {
  type = list(object({
    filter = string
    # (Required) Image tag filter pattern. Supports at most two wildcards.
    filter_type = string
    # (Required) Filter type. The only supported value is WILDCARD.
  }))
  default     = []
  description = "(Optional) Filters specifying tags that override the default tag mutability. A maximum of five filters is supported."
}

variable "lifecycle_policy" {
  type        = string
  default     = null
  description = "(Optional) Lifecycle policy JSON document applied to created repositories."
}

variable "prefix" {
  type        = string
  description = "(Required, Forces new resource) Repository name prefix to match. Use ROOT for repositories that do not match another template."
}

variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "repository_policy" {
  type        = string
  default     = null
  description = "(Optional) Repository policy JSON document applied to created repositories."
}

variable "resource_tags" {
  type        = map(string)
  default     = null
  description = "(Optional) Tags applied to created repositories."
}
