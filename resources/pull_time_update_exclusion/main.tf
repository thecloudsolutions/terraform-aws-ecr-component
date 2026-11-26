resource "aws_ecr_pull_time_update_exclusion" "this" {
  principal_arn = var.principal_arn
  region        = var.region
}
