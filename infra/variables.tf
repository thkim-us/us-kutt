variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  type    = list(string)
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "db_username" {
  default = "admin"
}

variable "db_password" {
  default = "test1234#!"  # 실제 배포 시에는 Secrets Manager 사용 권장
}

variable "domain_name" {
  default = "usmoney.kr"  # Route 53 도메인
}
