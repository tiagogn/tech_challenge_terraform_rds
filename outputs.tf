output "vpc_id" {
  value       = aws_vpc.main.id
  description = "ID da VPC criada"
}

output "public_subnets" {
  value       = aws_subnet.public[*].id
  description = "IDs das Subnets Públicas"
}

output "rds_endpoint" {
  value       = aws_db_instance.lanchonete_pedido_rds.endpoint
  description = "Endpoint do RDS"
}

output "db_name" {
  value       = var.db_name
  description = "Nome do Banco de Dados"
}

output "db_username" {
  value       = var.db_username
  description = "Usuário do Banco de Dados"
}

output "db_password" {
  value       = var.db_password
  description = "Senha do Banco de Dados"
}


