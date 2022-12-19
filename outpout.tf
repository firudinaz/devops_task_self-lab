output "registry_id" {
  description = "The account ID of the registry holding the repository."
  value       = aws_ecr_repository.flask-repository.registry_id
}
output "repository_url" {
  description = "The URL of the repository."
  value       = aws_ecr_repository.flask-repository.repository_url
}

output "rds_hostname" {
  description = "RDS instance hostname"
  value       = aws_db_instance.rds_instance.address
}

output "rds_port" {
  description = "RDS instance port"
  value       = aws_db_instance.rds_instance.port
}

output "rds_username" {
  description = "RDS instance root username"
  value       = aws_db_instance.rds_instance.username
}
