resource "aws_ecr_repository_creation_template" "this" {
  applied_for          = var.applied_for
  custom_role_arn      = var.custom_role_arn
  description          = var.description
  image_tag_mutability = var.image_tag_mutability
  lifecycle_policy     = var.lifecycle_policy
  prefix               = var.prefix
  region               = var.region
  repository_policy    = var.repository_policy

  dynamic "encryption_configuration" {
    for_each = var.encryption_configuration != null ? [var.encryption_configuration] : []
    content {
      encryption_type = lookup(encryption_configuration.value, "encryption_type", null)
      kms_key         = lookup(encryption_configuration.value, "kms_key", null)
    }
  }

  dynamic "image_tag_mutability_exclusion_filter" {
    for_each = var.image_tag_mutability_exclusion_filter != null ? var.image_tag_mutability_exclusion_filter : []
    content {
      filter      = image_tag_mutability_exclusion_filter.value.filter
      filter_type = image_tag_mutability_exclusion_filter.value.filter_type
    }
  }

  resource_tags = var.resource_tags
}
