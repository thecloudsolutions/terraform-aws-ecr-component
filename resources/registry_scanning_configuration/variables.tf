variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "scan_type" {
  type        = string
  description = "(Required) the scanning type to set for the registry. Can be either ENHANCED or BASIC."
}

variable "rule" {
  type = list(object({
    repository_filter = list(object({
      # (Required) One or more repository filter blocks, containing a filter (required string filtering repositories, see pattern regex here) and a filter_type (required string, currently only WILDCARD is supported).
      filter = string
      # (Required) string filtering repositories
      filter_type = string
      # (Required) string, currently only WILDCARD is supported.
    }))

    scan_frequency = string
    # (Required) The frequency that scans are performed at for a private registry. Can be SCAN_ON_PUSH, CONTINUOUS_SCAN, or MANUAL.
  }))
  default     = []
  description = "(Optional) One or multiple blocks specifying scanning rules to determine which repository filters are used and at what frequency scanning will occur"
}
