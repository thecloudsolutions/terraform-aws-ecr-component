output "registry_id" {
  value       = aws_ecr_pull_through_cache_rule.this.registry_id
  description = "The registry ID where the repository was created."
}