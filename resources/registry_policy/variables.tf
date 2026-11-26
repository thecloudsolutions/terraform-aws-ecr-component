variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "policy" {
  type        = string
  description = "(Required) The policy document. This is a JSON formatted string."
}
