# Provedor AWS
provider "aws" {
  region     = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

# Criar VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "main-vpc"
  }
}

# Obter as Zonas de Disponibilidade Disponíveis
data "aws_availability_zones" "available" {}

# Subnets Públicas em AZs Diferentes
resource "aws_subnet" "public" {
  count                  = 2
  vpc_id                 = aws_vpc.main.id
  cidr_block             = cidrsubnet(aws_vpc.main.cidr_block, 8, count.index)
  map_public_ip_on_launch = true
  availability_zone      = element(data.aws_availability_zones.available.names, count.index)
  tags = {
    Name = "public-subnet-${count.index + 1}"
  }
}

# Internet Gateway para a VPC
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "main-igw"
  }
}

# Tabela de Rotas para Subnets Públicas
resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "main-route-table"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

# Associar Subnets Públicas à Tabela de Rotas
resource "aws_route_table_association" "public" {
  count          = 2
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.main.id
}

# Security Group para RDS
resource "aws_security_group" "rds_sg" {
  name        = "rds-sg"
  description = "Security Group para PostgreSQL RDS"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"] # Permitir acesso dentro da VPC
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Subnet Group para RDS
resource "aws_db_subnet_group" "rds_subnet_group" {
  name        = "rds-subnet-group"
  description = "Subnet Group para RDS"
  subnet_ids  = aws_subnet.public[*].id
}

# Instância RDS PostgreSQL Pedido
variable "db_username_pedido" {}
variable "db_password_pedido" {}

resource "aws_db_instance" "lanchonete_pedido_rds" {
  allocated_storage      = 20
  engine                 = "postgres"
  engine_version         = "16.3"
  instance_class         = "db.t3.micro"
  db_name                = var.db_name_pedido
  username               = var.db_username_pedido
  password               = var.db_password_pedido
  parameter_group_name   = "default.postgres16"
  publicly_accessible    = false
  skip_final_snapshot    = true

  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name

  tags = {
    Name = "lanchonete-pedido-rds"
  }
}

# Instância RDS PostgreSQL Produto
variable "db_username_produto" {}
variable "db_password_produto" {}

resource "aws_db_instance" "lanchonete_produto_rds" {
  allocated_storage      = 20
  engine                 = "postgres"
  engine_version         = "16.3"
  instance_class         = "db.t3.micro"
  db_name                = var.db_name_produto
  username               = var.db_username_produto
  password               = var.db_password_produto
  parameter_group_name   = "default.postgres16"
  publicly_accessible    = false
  skip_final_snapshot    = true

  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name

  tags = {
    Name = "lanchonete-produto-rds"
  }
}