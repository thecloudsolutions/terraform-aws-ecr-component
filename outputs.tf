output "ecr_repository_arns" {
  value       = { for repository in keys(module.ecr) : repository => module.ecr[repository].repository_arn }
  description = "Full ARN of the repository."
}

output "ecr_repository_registry_ids" {
  value       = { for repository in keys(module.ecr) : repository => module.ecr[repository].repository_registry_id }
  description = "The registry ID where the repository was created."
}

output "ecr_repository_repository_urls" {
  value       = { for repository in keys(module.ecr) : repository => module.ecr[repository].repository_repository_url }
  description = "The URL of the repository (in the form aws_account_id.dkr.ecr.region.amazonaws.com/repositoryName)."
}

output "ecr_repository_tags_all" {
  value       = { for repository in keys(module.ecr) : repository => module.ecr[repository].repository_tags_all }
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}

output "ecr_repository_policy_repositories" {
  value       = { for repository_policy in keys(module.ecr) : repository_policy => module.ecr[repository_policy].repository_policy_repository }
  description = "The name of the repository."
}

output "ecr_repository_policy_registry_ids" {
  value       = { for repository_policy in keys(module.ecr) : repository_policy => module.ecr[repository_policy].repository_policy_registry_id }
  description = "The registry ID where the repository was created."
}

output "ecr_lifecycle_policy_repositories" {
  value       = { for lifecycle_policy in keys(module.ecr) : lifecycle_policy => module.ecr[lifecycle_policy].lifecycle_policy_repository }
  description = "The name of the repository."
}

output "ecr_lifecycle_policy_registry_ids" {
  value       = { for lifecycle_policy in keys(module.ecr) : lifecycle_policy => module.ecr[lifecycle_policy].lifecycle_policy_registry_id }
  description = "The registry ID where the repository was created."
}

output "ecr_pull_through_cache_rule_registry_ids" {
  value       = { for cache_rule in keys(module.ecr) : cache_rule => module.ecr[cache_rule].pull_through_cache_rule_registry_ids }
  description = "The registry ID where the repository was created."
}

output "ecr_registry_policy_registry_ids" {
  value       = { for registry_policy in keys(module.ecr) : registry_policy => module.ecr[registry_policy].registry_policy_registry_id }
  description = "The registry ID where the registry was created."
}

output "ecr_registry_scanning_configuration_registry_ids" {
  value       = { for configuration in keys(module.ecr) : configuration => module.ecr[configuration].registry_scanning_configuration_registry_id }
  description = "The registry ID the scanning configuration applies to."
}

output "ecr_replication_configuration_registry_ids" {
  value       = { for configuration in keys(module.ecr) : configuration => module.ecr[configuration].replication_configuration_registry_id }
  description = "The registry ID where the replication configuration was created."
}

output "ecr_repository_names" {
  value       = { for repository in keys(module.ecr) : repository => module.ecr[repository].repository_name }
  description = "Names of the repositories."
}

output "ecr_repository_creation_template_registry_ids" {
  value       = { for template in keys(module.ecr) : template => module.ecr[template].repository_creation_template_registry_ids }
  description = "Registry IDs the repository creation templates apply to."
}

output "ecr_repository_creation_template_prefixes" {
  value       = { for template in keys(module.ecr) : template => module.ecr[template].repository_creation_template_prefixes }
  description = "Repository name prefixes matched by the templates."
}

output "ecr_lifecycle_policy_document_jsons" {
  value       = { for policy_document in keys(module.ecr) : policy_document => module.ecr[policy_document].lifecycle_policy_document_jsons }
  description = "Lifecycle policies rendered as JSON documents."
}

output "ecr_account_setting_names" {
  value       = { for setting in keys(module.ecr) : setting => module.ecr[setting].account_setting_names }
  description = "Names of the account settings."
}

output "ecr_account_setting_values" {
  value       = { for setting in keys(module.ecr) : setting => module.ecr[setting].account_setting_values }
  description = "Values of the account settings."
}

output "ecr_pull_time_update_exclusion_principal_arns" {
  value       = { for exclusion in keys(module.ecr) : exclusion => module.ecr[exclusion].pull_time_update_exclusion_principal_arns }
  description = "ARNs of IAM principals excluded from image pull-time updates."
}
