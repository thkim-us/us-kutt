resource "aws_lb" "kutt_alb" {
  name               = "kutt-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = module.vpc.public_subnets
}

resource "aws_lb_target_group" "kutt_target_group" {
  name     = "kutt-tg"
  port     = 3000
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id
}

resource "aws_lb_listener" "kutt_listener" {
  load_balancer_arn = aws_lb.kutt_alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.kutt_target_group.arn
  }
}
