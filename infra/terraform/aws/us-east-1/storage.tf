# PHI-bearing buckets are region-locked. No cross-region replication for PHI.
resource "aws_s3_bucket" "documents" {
  bucket = "helixcare-${var.environment}-us-east-1-documents"
}

resource "aws_s3_bucket_versioning" "documents" {
  bucket = aws_s3_bucket.documents.id
  versioning_configuration { status = "Enabled" }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "documents" {
  bucket = aws_s3_bucket.documents.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
      kms_master_key_id = aws_kms_key.helixcare.arn
    }
  }
}

resource "aws_s3_bucket_public_access_block" "documents" {
  bucket                  = aws_s3_bucket.documents.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_lifecycle_configuration" "documents" {
  bucket = aws_s3_bucket.documents.id
  rule {
    id     = "hipaa-retention"
    status = "Enabled"
    transition { days = 90  storage_class = "STANDARD_IA" }
    transition { days = 365 storage_class = "GLACIER" }
    expiration { days = 2557 }   # ~7 years
  }
}

# DICOM imaging bucket
resource "aws_s3_bucket" "dicom" {
  bucket = "helixcare-${var.environment}-us-east-1-dicom"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "dicom" {
  bucket = aws_s3_bucket.dicom.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
      kms_master_key_id = aws_kms_key.helixcare.arn
    }
  }
}
