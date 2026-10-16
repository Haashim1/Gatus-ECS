output "fqdn" {
  value       = aws_route53_record.this.fqdn
  description = "The fully qualified domain name of the Route 53 record"
}