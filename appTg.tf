  resource "aws_lb_target_group" "app" {
    name     = "appTarget"
    port     = "80"
    protocol = "HTTP"
    vpc_id   = module.vpc.vpc_id
  }
    resource "aws_lb_target_group_attachment" "app" {
    target_group_arn = aws_lb_target_group.app.arn
    target_id        = aws_instance.app.id
    port             = 22
    }