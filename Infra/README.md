# Infraestrutura AWS - Terraform

Este diretório contém a definição da infraestrutura em AWS utilizando Terraform.

## Componentes provisionados:
- VPC (com subnets públicas e privadas)
- Internet Gateway
- NAT Gateway
- Route Table
- RDS PostgreSQL
- Cluster EKS
- Security Groups

## Como usar:

```bash
terraform init
terraform plan
terraform apply
