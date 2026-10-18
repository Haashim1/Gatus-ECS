output "tfstate_bucket_name" {
  value       = aws_s3_bucket.tf_s3_bucket.bucket
  description = "The name of the S3 bucket for storing Terraform state"
}

output "ecr_push_role_arn" {
  value       = aws_iam_role.ecr_push.arn
  description = "The ARN of the IAM role for pushing to ECR"
}
output "github_terraform_role_arn" {
  value       = aws_iam_role.github_terraform.arn
  description = "The ARN of the IAM role for GitHub Terraform actions"
}