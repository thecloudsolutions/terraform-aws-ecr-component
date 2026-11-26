output "registry_id" {
  value       = aws_ecr_repository_creation_template.this.registry_id
  description = "The registry ID the repository creation template applies to."
}

output "prefix" {
  value       = aws_ecr_repository_creation_template.this.prefix
  description = "Repository name prefix matched by the template."
}
