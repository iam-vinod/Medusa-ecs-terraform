output "alb_dns" {
  value       = "http://${aws_lb.medusa_alb.dns_name}"
  description = "URL to access the Medusa backend"
}
