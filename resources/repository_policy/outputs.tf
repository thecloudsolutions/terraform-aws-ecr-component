output "repository" {
  value       = aws_ecr_repository_policy.this.repository
  description = "The name of the repository."
}

output "registry_id" {
  value       = aws_ecr_repository_policy.this.registry_id
  description = "The registry ID where the repository was created."
}