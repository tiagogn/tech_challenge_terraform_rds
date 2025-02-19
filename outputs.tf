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

output "db_name_pedido" {
  value       = var.db_name_pedido
  description = "Nome do Banco de Dados"
}

output "db_username_pedido" {
  value       = var.db_username_pedido
  description = "Usuário do Banco de Dados"
}

output "db_password_pedido" {
  value       = var.db_password_pedido
  description = "Senha do Banco de Dados"
}

output "db_name_produto" {
  value       = var.db_name_produto
  description = "Nome do Banco de Dados"
}

output "db_username_produto" {
  value       = var.db_username_produto
  description = "Usuário do Banco de Dados"
}

output "db_password_produto" {
  value       = var.db_password_produto
  description = "Senha do Banco de Dados"
}



