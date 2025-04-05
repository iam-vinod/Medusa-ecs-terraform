resource "aws_lb" "medusa_alb" {
  name               = "medusa-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = module.vpc.public_subnets
  security_groups    = [aws_security_group.alb_sg.id]
}

resource "aws_lb_target_group" "medusa_tg" {
  name     = "medusa-tg"
  port     = 9000
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id
  target_type = "ip"
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.medusa_alb.arn
  port              = 80
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.medusa_tg.arn
  }
}
