output "name" {
  value       = aws_ecr_account_setting.this.name
  description = "Name of the account setting."
}

output "value" {
  value       = aws_ecr_account_setting.this.value
  description = "Value of the account setting."
}
