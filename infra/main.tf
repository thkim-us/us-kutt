# 테라폼 백엔드 설정
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  
  backend "s3" {
    bucket = "tf-us-kutt"
    key    = "terraform.tfstate"
    region = "ap-northeast-2"
  }
} 