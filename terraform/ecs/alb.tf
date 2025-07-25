# Load Balancer (ALB)
resource "aws_lb" "alb" {
  name               = "simple-api-alb"
  internal           = false                      # false = público, true = interno
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb.id]
  subnets            = aws_subnet.public[*].id    # Subnets públicas
}

# Target Group do ALB
resource "aws_lb_target_group" "tg" {
  name     = "simple-api-tg"
  port     = 3000
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  target_type = "ip"  # 🔥 ESSENCIAL para ECS Fargate + awsvpc

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
    matcher             = "200-399"
  }
}

# Listener do ALB (porta 80)
resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}
