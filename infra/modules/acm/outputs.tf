output "certificate_arn" {
  value       = aws_acm_certificate_validation.cert_validation.certificate_arn
  description = "The ARN of the ACM certificate"
}