output "principal_arn" {
  value       = aws_ecr_pull_time_update_exclusion.this.principal_arn
  description = "ARN of the IAM principal excluded from image pull-time updates."
}
