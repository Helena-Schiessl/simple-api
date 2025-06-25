# Criação do cluster ECS
resource "aws_ecs_cluster" "main" {
  name = "ecs-simple-api"
}

# Definição da Task que roda no Fargate
resource "aws_ecs_task_definition" "task" {
  family                   = "simple-api"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"

  execution_role_arn = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = jsonencode([
    {
      name      = "simple-api"
      image     = "${aws_ecr_repository.repo.repository_url}:latest"
      portMappings = [
        {
          containerPort = 3000
          hostPort      = 3000
          protocol      = "tcp"
        }
      ]
      environment = [
        { name = "DB_HOST", value = aws_db_instance.postgres.address },
        { name = "DB_USER", value = "helenadb" },
        { name = "DB_PASSWORD", value = "SenhaForteAqui" },
        { name = "DB_DATABASE", value = "postgres" }
      ]
    }
  ])
}

# Criação do serviço que executa a Task no cluster ECS
resource "aws_ecs_service" "service" {
  name            = "simple-api-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.task.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = aws_subnet.private[*].id
    security_groups  = [aws_security_group.ecs.id]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.tg.arn
    container_name   = "simple-api"
    container_port   = 3000
  }

  depends_on = [aws_lb_listener.listener]
}
