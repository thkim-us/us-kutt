output "alb_dns_name" {
  value = aws_lb.kutt_alb.dns_name
}

output "rds_endpoint" {
  value = aws_db_instance.kutt_db.address
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.kutt_cluster.name
}
