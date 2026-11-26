resource "aws_ecr_account_setting" "this" {
  name   = var.name
  region = var.region
  value  = var.value
}
