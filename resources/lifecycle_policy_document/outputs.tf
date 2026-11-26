output "json" {
  value       = data.aws_ecr_lifecycle_policy_document.this.json
  description = "Lifecycle policy rendered as a JSON document."
}
