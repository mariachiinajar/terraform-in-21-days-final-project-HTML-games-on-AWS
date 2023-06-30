output "target_group_arn" {
  value = aws_lb_target_group.main.arn
}

output "loadbalancer_sg" {
  value = aws_security_group.load-balancer.id
}

