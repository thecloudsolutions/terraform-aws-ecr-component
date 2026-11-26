module "ecr" {
  source = "./module"

  for_each = var.ecr_map

  repository                      = each.value.repository
  repository_policy               = lookup(each.value, "repository_policy", null)
  lifecycle_policy                = lookup(each.value, "lifecycle_policy", null)
  pull_through_cache_rules        = lookup(each.value, "pull_through_cache_rules", {})
  registry_policy                 = lookup(each.value, "registry_policy", null)
  registry_scanning_configuration = lookup(each.value, "registry_scanning_configuration", null)
  replication_configuration       = lookup(each.value, "replication_configuration", null)
  repository_creation_templates   = lookup(each.value, "repository_creation_templates", {})
  lifecycle_policy_documents      = lookup(each.value, "lifecycle_policy_documents", {})
  account_settings                = lookup(each.value, "account_settings", {})
  pull_time_update_exclusions     = lookup(each.value, "pull_time_update_exclusions", {})
}
