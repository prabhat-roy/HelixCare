resource "aws_db_subnet_group" "pg" {
  name       = "helixcare-${var.environment}-us-east-1"
  subnet_ids = aws_subnet.private[*].id
}

resource "random_password" "pg" { length = 32  special = true }

resource "aws_db_instance" "postgres" {
  identifier                          = "helixcare-${var.environment}-us-east-1"
  engine                              = "postgres"
  engine_version                      = var.rds_engine_version
  instance_class                      = var.rds_instance
  allocated_storage                   = var.rds_storage_gb
  storage_encrypted                   = true
  kms_key_id                          = aws_kms_key.helixcare.arn
  db_name                             = "helixcare"
  username                            = "helixcare"
  password                            = random_password.pg.result
  db_subnet_group_name                = aws_db_subnet_group.pg.name
  multi_az                            = true
  backup_retention_period             = 35
  deletion_protection                 = true
  performance_insights_enabled        = true
  performance_insights_kms_key_id     = aws_kms_key.helixcare.arn
  iam_database_authentication_enabled = true
  skip_final_snapshot                 = false
  final_snapshot_identifier           = "helixcare-${var.environment}-us-east-1-final"
  copy_tags_to_snapshot               = true
}

resource "aws_elasticache_subnet_group" "redis" {
  name       = "helixcare-${var.environment}-us-east-1"
  subnet_ids = aws_subnet.private[*].id
}

resource "aws_elasticache_replication_group" "redis" {
  replication_group_id        = "helixcare-${var.environment}-us-east-1"
  description                 = "HelixCare Redis (sessions/telehealth state)"
  node_type                   = var.redis_node_type
  num_cache_clusters          = var.redis_num_nodes
  automatic_failover_enabled  = true
  multi_az_enabled            = true
  engine_version              = "7.1"
  port                        = 6379
  subnet_group_name           = aws_elasticache_subnet_group.redis.name
  at_rest_encryption_enabled  = true
  transit_encryption_enabled  = true
  kms_key_id                  = aws_kms_key.helixcare.arn
}

resource "aws_msk_cluster" "kafka" {
  cluster_name           = "helixcare-${var.environment}-us-east-1"
  kafka_version          = var.kafka_version
  number_of_broker_nodes = var.kafka_broker_count
  broker_node_group_info {
    instance_type   = var.kafka_broker_instance
    client_subnets  = aws_subnet.private[*].id
    storage_info { ebs_storage_info { volume_size = 2000 } }
  }
  encryption_info {
    encryption_at_rest_kms_key_arn = aws_kms_key.helixcare.arn
    encryption_in_transit { client_broker = "TLS"  in_cluster = true }
  }
}

# DocumentDB for FHIR resource cache + clinical notes
resource "aws_docdb_subnet_group" "mongo" {
  name       = "helixcare-${var.environment}-us-east-1"
  subnet_ids = aws_subnet.private[*].id
}

resource "aws_docdb_cluster" "mongo" {
  cluster_identifier              = "helixcare-${var.environment}-us-east-1"
  engine                          = "docdb"
  master_username                 = "helixcare"
  master_password                 = random_password.pg.result
  db_subnet_group_name            = aws_docdb_subnet_group.mongo.name
  storage_encrypted               = true
  kms_key_id                      = aws_kms_key.helixcare.arn
  backup_retention_period         = 35
  skip_final_snapshot             = false
  final_snapshot_identifier       = "helixcare-${var.environment}-us-east-1-mongo-final"
}

# Keyspaces for HIPAA audit (Cassandra-compatible, 6+ year retention)
resource "aws_keyspaces_keyspace" "audit" {
  name = "helixcare_audit_us_east_1"
}
