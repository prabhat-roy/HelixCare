# Region-scoped CMK; rotated annually.
resource "aws_kms_key" "helixcare" {
  description             = "HelixCare ${var.environment} us-east-1 CMK (PHI)"
  deletion_window_in_days = 30
  enable_key_rotation     = true
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Sid       = "EnableRoot"
      Effect    = "Allow"
      Principal = { AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root" }
      Action    = "kms:*"
      Resource  = "*"
    }]
  })
}

resource "aws_kms_alias" "helixcare" {
  name          = "alias/helixcare-${var.environment}-us-east-1"
  target_key_id = aws_kms_key.helixcare.id
}

data "aws_caller_identity" "current" {}

resource "aws_secretsmanager_secret" "pg" {
  name        = "helixcare/${var.environment}/us-east-1/postgres"
  kms_key_id  = aws_kms_key.helixcare.arn
  description = "PHI-bearing postgres credentials, region-locked"
}

resource "aws_secretsmanager_secret_version" "pg" {
  secret_id = aws_secretsmanager_secret.pg.id
  secret_string = jsonencode({
    username = aws_db_instance.postgres.username
    password = random_password.pg.result
    host     = aws_db_instance.postgres.address
    port     = aws_db_instance.postgres.port
    dbname   = aws_db_instance.postgres.db_name
  })
}
