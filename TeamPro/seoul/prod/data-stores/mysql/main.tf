provider "aws" {
  region = "ap-northeast-2"

  # 2.x 버전의 AWS 공급자 허용
  version = "~> 2.0"
}

terraform {
  backend "s3" {
    # This backend configuration is filled in automatically at test time by Terratest. If you wish to run this example
    # manually, uncomment and fill in the config below.

    bucket         = "terraform-seoul-cloudmaker"
    key            = "prod/mysql/terraform.tfstate"
    region         = "ap-northeast-2"
    dynamodb_table = "terraform-seoul-cloudmaker"
    encrypt        = true
  }
}

resource "aws_db_instance" "example" {
  identifier_prefix   = "prod-terraform-up-and-running"
  engine              = "mysql"
  allocated_storage   = 10
  instance_class      = "db.t2.micro"
  name                = var.db_name
  username            = "admin"
  password            = jsondecode(data.aws_secretsmanager_secret_version.db_password.secret_string)["password"]
  skip_final_snapshot = true
}

data "aws_secretsmanager_secret_version" "db_password" {
  secret_id = "volteon/password"
}
