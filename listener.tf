resource "aws_lb_listener" "jenkins" {
    load_balancer_arn    = aws_lb.alb.id
    port                 = "80"
    protocol             = "HTTP"

  default_action {
  type             = "forward"
  target_group_arn = aws_lb_target_group.jenkins.arn
  }
}
  resource "aws_lb_listener_rule" "jenkins" {
  listener_arn = aws_lb_listener.jenkins.arn
  priority     = 100
    action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.jenkins.arn
    }
    condition {
    path-pattern{
      values = ["/jenkins","/jenkins/*"]
      }
    }
}
  resource "aws_lb_listener" "app" {
  load_balancer_arn    = aws_lb.alb.id
  port                 = "80"
  protocol             = "HTTP"
  default_action {
  type             = "forward"
  target_group_arn = aws_lb_target_group.jenkins.arn
  }
  }
  resource "aws_lb_listener_rule" "app" {
  listener_arn = aws_lb_listener.jenkins.arn
  priority     = 101
  action {
  type             = "forward"
  target_group_arn = aws_lb_target_group.app.arn
  }
  condition {
    path-pattern{
      values = ["/app","/app/*"]
    }
  }
}

