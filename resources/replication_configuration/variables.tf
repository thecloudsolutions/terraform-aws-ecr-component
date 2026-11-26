variable "replication_configuration" {
  type = object({
    rule = list(object({
      # (Required) The replication rules for a replication configuration. A maximum of 10 are allowed per replication_configuration 

      destination = list(object({
        # (Required) the details of a replication destination. A maximum of 25 are allowed per rule
        region = string
        # (Required) A Region to replicate to.
        registry_id = string
        # (Required) The account ID of the destination registry to replicate to.
      }))

      repository_filter = optional(list(object({
        # (Optional) filters for a replication rule. 
        filter = string
        # (Required) The repository filter details.
        filter_type = string
        # (Required) The repository filter type. The only supported value is PREFIX_MATCH, which is a repository name prefix specified with the filter parameter.
      })), [])
    }))
  })
  default     = null
  description = "(Optional) Replication configuration for a registry."
}

variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}
