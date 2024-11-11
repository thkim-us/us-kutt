resource "aws_db_subnet_group" "kutt_db_subnet_group" {
  name       = "kutt-db-subnet-group"
  subnet_ids = module.vpc.private_subnets
}

resource "aws_db_instance" "kutt_db" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  name                 = "kutt"
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.mysql8.0"
  db_subnet_group_name = aws_db_subnet_group.kutt_db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.kutt_db_sg.id]
  skip_final_snapshot  = true
}
