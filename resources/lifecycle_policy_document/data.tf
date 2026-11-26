data "aws_ecr_lifecycle_policy_document" "this" {
  dynamic "rule" {
    for_each = var.rule
    content {
      priority    = rule.value.priority
      description = lookup(rule.value, "description", null)

      dynamic "action" {
        for_each = rule.value.action != null ? [rule.value.action] : []
        content {
          type                 = action.value.type
          target_storage_class = lookup(action.value, "target_storage_class", null)
        }
      }

      selection {
        count_number     = rule.value.selection.count_number
        count_type       = rule.value.selection.count_type
        count_unit       = lookup(rule.value.selection, "count_unit", null)
        storage_class    = lookup(rule.value.selection, "storage_class", null)
        tag_pattern_list = lookup(rule.value.selection, "tag_pattern_list", null)
        tag_prefix_list  = lookup(rule.value.selection, "tag_prefix_list", null)
        tag_status       = rule.value.selection.tag_status
      }
    }
  }
}
