resource "aws_db_subnet_group" "default" {
  name       = "rds-subnet-group"
  subnet_ids = aws_subnet.private[*].id
}

resource "aws_db_instance" "postgres" {
  identifier        = "postgres-db"
  engine            = "postgres"
  instance_class    = "db.t3.micro"
  allocated_storage = 20
  username          = "testekxc"
  password          = "2HdN9zj10dUxtYp"
  db_subnet_group_name = aws_db_subnet_group.default.id
  vpc_security_group_ids = [aws_security_group.rds.id]
  publicly_accessible = false
  skip_final_snapshot = true
}
