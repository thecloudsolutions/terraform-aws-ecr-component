output "repository_arn" {
  value       = var.repository != null ? module.repository[0].arn : null
  description = "Full ARN of the repository."
}

output "repository_registry_id" {
  value       = var.repository != null ? module.repository[0].registry_id : null
  description = "The registry ID where the repository was created."
}

output "repository_repository_url" {
  value       = var.repository != null ? module.repository[0].repository_url : null
  description = "The URL of the repository (in the form aws_account_id.dkr.ecr.region.amazonaws.com/repositoryName)."
}

output "repository_tags_all" {
  value       = var.repository != null ? module.repository[0].tags_all : null
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}

output "repository_policy_repository" {
  value       = var.repository_policy != null ? module.repository_policy[0].repository : null
  description = "The name of the repository."
}

output "repository_policy_registry_id" {
  value       = var.repository_policy != null ? module.repository_policy[0].registry_id : null
  description = "The registry ID where the repository was created."
}

output "lifecycle_policy_repository" {
  value       = var.lifecycle_policy != null ? module.lifecycle_policy[0].repository : null
  description = "The name of the repository."
}

output "lifecycle_policy_registry_id" {
  value       = var.lifecycle_policy != null ? module.lifecycle_policy[0].registry_id : null
  description = "The registry ID where the repository was created."
}

output "pull_through_cache_rule_registry_ids" {
  value       = { for cache_rule in keys(module.pull_through_cache_rule) : cache_rule => module.pull_through_cache_rule[cache_rule].registry_id }
  description = "The registry ID where the repository was created."
}

output "registry_policy_registry_id" {
  value       = var.registry_policy != null ? module.registry_policy[0].registry_id : null
  description = "The registry ID where the registry was created."
}

output "registry_scanning_configuration_registry_id" {
  value       = var.registry_scanning_configuration != null ? module.registry_scanning_configuration[0].registry_id : null
  description = "The registry ID the scanning configuration applies to."
}

output "replication_configuration_registry_id" {
  value       = var.replication_configuration != null ? module.replication_configuration[0].registry_id : null
  description = "The registry ID where the replication configuration was created."
}

output "repository_name" {
  value       = var.repository != null ? module.repository[0].name : null
  description = "The name of the repository."
}

output "repository_creation_template_registry_ids" {
  value       = { for template in keys(module.repository_creation_template) : template => module.repository_creation_template[template].registry_id }
  description = "Registry IDs the repository creation templates apply to."
}

output "repository_creation_template_prefixes" {
  value       = { for template in keys(module.repository_creation_template) : template => module.repository_creation_template[template].prefix }
  description = "Repository name prefixes matched by the templates."
}

output "lifecycle_policy_document_jsons" {
  value       = { for policy_document in keys(module.lifecycle_policy_document) : policy_document => module.lifecycle_policy_document[policy_document].json }
  description = "Lifecycle policies rendered as JSON documents."
}

output "account_setting_names" {
  value       = { for setting in keys(module.account_setting) : setting => module.account_setting[setting].name }
  description = "Names of the account settings."
}

output "account_setting_values" {
  value       = { for setting in keys(module.account_setting) : setting => module.account_setting[setting].value }
  description = "Values of the account settings."
}

output "pull_time_update_exclusion_principal_arns" {
  value       = { for exclusion in keys(module.pull_time_update_exclusion) : exclusion => module.pull_time_update_exclusion[exclusion].principal_arn }
  description = "ARNs of IAM principals excluded from image pull-time updates."
}
