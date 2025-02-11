variable "aws_access_key" {
  description = "AWS Access Key"
  type        = string
}

variable "aws_secret_key" {
  description = "AWS Secret Access Key"
  type        = string
}

variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "CIDR Block para a VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "db_name_pedido" {
  description = "Database Name"
  type        = string
  default     = "lanchonetepedido"
}

variable "db_username_pedido" {
  description = "Database Username"
  type        = string
  default     = "lanchonete_pedido_user"
}

variable "db_password_pedido" {
  description = "Database Password"
  type        = string
  default     = "lanchonete_pedido_password"
}

variable "db_name_produto" {
  description = "Database Name"
  type        = string
  default     = "lanchoneteproduto"
}

variable "db_username_produto" {
  description = "Database Username"
  type        = string
  default     = "lanchonete_produto_user"
}

variable "db_password_produto" {
  description = "Database Password"
  type        = string
  default     = "lanchonete_produto_password"
}