output "registry_id" {
  value       = aws_ecr_registry_scanning_configuration.this.registry_id
  description = "The registry ID the scanning configuration applies to."
}