resource "aws_lb_target_group" "jenkins" {
name     = "jenkinsTarget"
port     = "80"
protocol = "HTTP"
vpc_id   = module.vpc.vpc_id
}
  resource "aws_lb_target_group_attachment" "jenkins_tg" {
  target_group_arn = aws_lb_target_group.jenkins.arn
  target_id        = aws_instance.jenkins.id
  port             = 22
  }