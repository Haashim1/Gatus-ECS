output "tfstate_bucket_name" {
  value       = aws_s3_bucket.tf_s3_bucket.bucket
  description = "The name of the S3 bucket for storing Terraform state"
}