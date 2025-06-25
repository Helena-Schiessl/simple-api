# Outputs principais da infraestrutura

output "vpc_id" {
  description = "ID da VPC criada"
  value       = module.vpc.vpc_id
}

output "private_subnets" {
  description = "Subnets privadas criadas"
  value       = module.vpc.private_subnets
}

output "public_subnets" {
  description = "Subnets públicas criadas"
  value       = module.vpc.public_subnets
}

output "rds_endpoint" {
  description = "Endpoint do banco de dados RDS"
  value       = module.rds.db_instance_endpoint
}

output "rds_sg_id" {
  description = "ID do Security Group do RDS"
  value       = module.security_group_rds.security_group_id
}
