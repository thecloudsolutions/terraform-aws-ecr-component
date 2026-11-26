output "registry_id" {
  value       = aws_ecr_registry_policy.this.registry_id
  description = "The registry ID where the registry was created."
}
