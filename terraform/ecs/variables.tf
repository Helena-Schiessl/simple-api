# variables.tf

variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "Availability zones"
  default     = ["us-east-1a", "us-east-1b"]
}

variable "public_subnets" {
  description = "Public subnets"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "Private subnets"
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "db_username" {
  description = "RDS master username"
  default     = "adminh"
}

variable "db_password" {
  description = "RDS master password"
  default     = "senha_forte"
}

variable "db_name" {
  description = "Database name"
  default     = "postgres"
}

variable "my_ip" {
  description = "Your IP address with /32 for security group"
  default     = "SEU_IP/32" # Substitua SEU_IP pelo seu IP real
}