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

variable "db_name" {
  description = "Database Name"
  type        = string
  default     = "lanchonete"
}

variable "db_username" {
  description = "Database Username"
  type        = string
  default     = "lanchonete_user"
}

variable "db_password" {
  description = "Database Password"
  type        = string
  default     = "lanchonete_password"
}