output "db_address" {
  value       = aws_db_instance.this.address
  description = "The address of the RDS instance"
}

output "db_name" {
  value       = aws_db_instance.this.db_name
  description = "The name of the database for the RDS instance"
}

output "db_secret_arn" {
    value = aws_db_instance.this.master_user_secret[0].secret_arn
  description = "The ARN of the secret containing the master user password for the RDS instance"
}