resource "aws_ecs_task_definition" "kutt_task" {
  family                   = "kutt-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 512
  memory                   = 1024

  container_definitions = jsonencode([
    {
      name      = "kutt"
      image     = "your-docker-image-url"  # Kutt 이미지를 사용
      essential = true
      portMappings = [
        {
          containerPort = 3000
          hostPort      = 3000
        }
      ]
      environment = [
        {
          name  = "DATABASE_URL"
          value = "mysql://${var.db_username}:${var.db_password}@${aws_db_instance.kutt_db.address}/${aws_db_instance.kutt_db.name}"
        },
      ]
    }
  ])
}
