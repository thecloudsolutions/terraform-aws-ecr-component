module "repository" {
  source = "../resources/repository"

  count = var.repository != null ? 1 : 0

  name                                  = var.repository.name
  encryption_configuration              = lookup(var.repository, "encryption_configuration", null)
  force_delete                          = lookup(var.repository, "force_delete", null)
  image_tag_mutability                  = lookup(var.repository, "image_tag_mutability", null)
  image_tag_mutability_exclusion_filter = lookup(var.repository, "image_tag_mutability_exclusion_filter", null)
  image_scanning_configuration          = lookup(var.repository, "image_scanning_configuration", null)
  region                                = lookup(var.repository, "region", null)
  timeouts                              = lookup(var.repository, "timeouts", null)

  tags = lookup(var.repository, "tags", null)
}

module "repository_policy" {
  source = "../resources/repository_policy"

  count = var.repository_policy != null ? 1 : 0

  repository = try(var.repository_policy.repository, null) != null ? var.repository_policy.repository : module.repository[0].name
  region     = try(var.repository_policy.region, null) != null ? var.repository_policy.region : var.repository_policy.repository == null ? try(var.repository.region, null) : null

  policy = var.repository_policy.policy
}

module "lifecycle_policy" {
  source = "../resources/lifecycle_policy"

  count = var.lifecycle_policy != null ? 1 : 0

  repository = try(var.lifecycle_policy.repository, null) != null ? var.lifecycle_policy.repository : module.repository[0].name
  region     = try(var.lifecycle_policy.region, null) != null ? var.lifecycle_policy.region : var.lifecycle_policy.repository == null ? try(var.repository.region, null) : null

  policy = try(var.lifecycle_policy.policy, null) != null ? var.lifecycle_policy.policy : module.lifecycle_policy_document[var.lifecycle_policy.policy_document_custom_name].json

}

module "pull_through_cache_rule" {
  source = "../resources/pull_through_cache_rule"

  for_each = var.pull_through_cache_rules

  ecr_repository_prefix      = each.value.ecr_repository_prefix
  upstream_registry_url      = each.value.upstream_registry_url
  credential_arn             = lookup(each.value, "credential_arn", null)
  custom_role_arn            = lookup(each.value, "custom_role_arn", null)
  region                     = lookup(each.value, "region", null)
  upstream_repository_prefix = lookup(each.value, "upstream_repository_prefix", null)
}

module "registry_policy" {
  source = "../resources/registry_policy"

  count = var.registry_policy != null ? 1 : 0

  policy = var.registry_policy.policy
  region = lookup(var.registry_policy, "region", null)

  depends_on = [module.account_setting]
}

module "registry_scanning_configuration" {
  source = "../resources/registry_scanning_configuration"

  count = var.registry_scanning_configuration != null ? 1 : 0

  scan_type = var.registry_scanning_configuration.scan_type
  rule      = lookup(var.registry_scanning_configuration, "rule", [])
  region    = lookup(var.registry_scanning_configuration, "region", null)

  depends_on = [module.account_setting]
}

module "replication_configuration" {
  source = "../resources/replication_configuration"

  count = var.replication_configuration != null ? 1 : 0

  replication_configuration = var.replication_configuration.replication_configuration
  region                    = lookup(var.replication_configuration, "region", null)
}

module "repository_creation_template" {
  source = "../resources/repository_creation_template"

  for_each = var.repository_creation_templates

  applied_for                           = each.value.applied_for
  custom_role_arn                       = lookup(each.value, "custom_role_arn", null)
  description                           = lookup(each.value, "description", null)
  encryption_configuration              = lookup(each.value, "encryption_configuration", null)
  image_tag_mutability                  = lookup(each.value, "image_tag_mutability", null)
  image_tag_mutability_exclusion_filter = lookup(each.value, "image_tag_mutability_exclusion_filter", [])
  lifecycle_policy                      = try(each.value.lifecycle_policy, null) != null ? each.value.lifecycle_policy : try(each.value.lifecycle_policy_document_custom_name, null) != null ? module.lifecycle_policy_document[each.value.lifecycle_policy_document_custom_name].json : null
  prefix                                = each.value.prefix
  region                                = lookup(each.value, "region", null)
  repository_policy                     = lookup(each.value, "repository_policy", null)

  resource_tags = lookup(each.value, "resource_tags", null)
}

module "lifecycle_policy_document" {
  source = "../resources/lifecycle_policy_document"

  for_each = var.lifecycle_policy_documents

  rule = each.value.rule
}

module "account_setting" {
  source = "../resources/account_setting"

  for_each = var.account_settings

  name   = each.value.name
  region = lookup(each.value, "region", null)
  value  = each.value.value
}

module "pull_time_update_exclusion" {
  source = "../resources/pull_time_update_exclusion"

  for_each = var.pull_time_update_exclusions

  principal_arn = each.value.principal_arn
  region        = lookup(each.value, "region", null)
}
