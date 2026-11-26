variable "rule" {
  type = list(object({
    priority = number
    # (Required) Evaluation priority. Lower numbers are evaluated first.
    description = optional(string)
    # (Optional) Description of the rule.
    action = optional(object({
      type = string
      # (Required) Action to take. Supports expire and transition.
      target_storage_class = optional(string)
      # (Optional) Target storage class. Required for transition; supports archive.
    }))
    selection = object({
      count_number = number
      # (Required) Image count or number of days used by the rule.
      count_type = string
      # (Required) Supports imageCountMoreThan, sinceImagePushed, sinceImagePulled, and sinceImageTransitioned.
      count_unit = optional(string)
      # (Optional) Unit for time-based rules. Supports days.
      storage_class = optional(string)
      # (Optional) Storage class to select. Supports standard and archive.
      tag_pattern_list = optional(list(string))
      # (Optional) Image tag patterns used to select tagged images.
      tag_prefix_list = optional(list(string))
      # (Optional) Image tag prefixes used to select tagged images.
      tag_status = string
      # (Required) Tag status to select. Supports tagged, untagged, and any.
    })
  }))
  description = "(Required) Rules used to generate the lifecycle policy document."
}
