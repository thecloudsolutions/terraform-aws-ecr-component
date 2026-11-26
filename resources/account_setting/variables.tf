variable "name" {
  type        = string
  description = "(Required, Forces new resource) Account setting name. Supports BASIC_SCAN_TYPE_VERSION, BLOB_MOUNTING, and REGISTRY_POLICY_SCOPE."
}

variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "value" {
  type        = string
  description = "(Required) Setting value. Use AWS_NATIVE or CLAIR for BASIC_SCAN_TYPE_VERSION, ENABLED or DISABLED for BLOB_MOUNTING, and V1 or V2 for REGISTRY_POLICY_SCOPE. Removing this resource does not reset the setting."
}
