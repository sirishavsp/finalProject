resource "aws_lb" "alb" {
name = "my-alb"
load_balancer_type = "application"
subnets = ["subnet-0f1de3ac790c71f8a", "subnet-045b11ea22d222515"]
security_groups    = [aws_security_group.ingress-all-sg.id]
}