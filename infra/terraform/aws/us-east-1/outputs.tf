output "region"                  { value = "us-east-1" }
output "eks_cluster_name"        { value = module.eks.cluster_name }
output "eks_cluster_endpoint"    { value = module.eks.cluster_endpoint }
output "eks_oidc_issuer"         { value = module.eks.cluster_oidc_issuer_url }
output "vpc_id"                  { value = aws_vpc.this.id }
output "private_subnets"         { value = aws_subnet.private[*].id }
output "postgres_endpoint"       { value = aws_db_instance.postgres.endpoint  sensitive = true }
output "redis_primary_endpoint"  { value = aws_elasticache_replication_group.redis.primary_endpoint_address }
output "kafka_bootstrap_brokers" { value = aws_msk_cluster.kafka.bootstrap_brokers_tls  sensitive = true }
output "documents_bucket"        { value = aws_s3_bucket.documents.bucket }
output "dicom_bucket"            { value = aws_s3_bucket.dicom.bucket }
output "kms_key_arn"             { value = aws_kms_key.helixcare.arn }
output "audit_keyspace"          { value = aws_keyspaces_keyspace.audit.name }
