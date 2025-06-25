provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "4.0.2"

  name = "simple-api-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Name = "simple-api-vpc"
  }
}

module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "5.0.2"

  identifier         = "postgres-db"
  engine             = "postgres"
  engine_version     = "14"
  instance_class     = "db.t3.micro"
  allocated_storage  = 20
  username           = "admin"
  password           = "senha"
  db_name            = "postgres"
  publicly_accessible = true

  vpc_security_group_ids = [module.security_group_rds.security_group_id]
  subnet_ids             = module.vpc.private_subnets
  skip_final_snapshot    = true
}

module "security_group_rds" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name        = "rds-sg"
  description = "Allow PostgreSQL access"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      cidr_blocks = ["191.180.193.253/32"]
    }
  ]
}