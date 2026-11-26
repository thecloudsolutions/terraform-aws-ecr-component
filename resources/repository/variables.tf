variable "name" {
  type        = string
  description = "(Required) Name of the repository."
}

variable "encryption_configuration" {
  type = object({
    encryption_type = optional(string)
    # (Optional) The encryption type to use for the repository. Valid values are AES256 or KMS. Defaults to AES256.
    kms_key = optional(string)
    # (Optional) The ARN of the KMS key to use when encryption_type is KMS. If not specified, uses the default AWS managed key for ECR.
  })
  default     = null
  description = "(Optional) Encryption configuration for the repository."
}

variable "force_delete" {
  type        = bool
  default     = null
  description = "(Optional) If true, will delete the repository even if it contains images. Defaults to false."
}

variable "image_tag_mutability" {
  type        = string
  default     = null
  description = "(Optional) The tag mutability setting for the repository. Must be one of MUTABLE, IMMUTABLE, IMMUTABLE_WITH_EXCLUSION, or MUTABLE_WITH_EXCLUSION. Defaults to MUTABLE."
}

variable "image_tag_mutability_exclusion_filter" {
  type = list(object({
    filter = string
    # (Required) Filter pattern for excluding image tags from the mutability setting. Supports at most two wildcards.
    filter_type = string
    # (Required) Filter type. The only supported value is WILDCARD.
  }))
  default     = []
  description = "(Optional) Filters specifying image tags that override the repository's default tag mutability setting. A maximum of five filters is supported."
}

variable "image_scanning_configuration" {
  type = object({
    scan_on_push = bool
    # (Required) Indicates whether images are scanned after being pushed to the repository (true) or not scanned (false).
  })
  default     = null
  description = "(Optional) Configuration block that defines image scanning configuration for the repository. By default, image scanning must be manually triggered."
}

variable "timeouts" {
  type = object({
    delete = optional(string)
    # (Default 20 minutes) How long to wait for a repository to be deleted.
  })
  default     = null
  description = "(Optional) Timeouts for the service."
}

variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "tags" {
  type        = map(string)
  default     = null
  description = "(Optional) A map of tags assigned to all modules."
}
