data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

locals {
  bucket_name         = format("%s-%s-%s", var.project_name, data.aws_caller_identity.current.account_id, data.aws_region.current.region)
  tfstate_bucket_name = format("%s-tfstate", local.bucket_name)
}


resource "aws_s3_bucket" "tf_s3_bucket" {
  bucket = local.tfstate_bucket_name
  tags = {
  Name = local.tfstate_bucket_name }
  lifecycle {
    prevent_destroy = true
  }

}

resource "aws_s3_bucket_versioning" "tf_s3_bucket_versioning" {
  bucket = aws_s3_bucket.tf_s3_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_s3_bucket_server_side_encryption_configuration" "tf_s3_bucket_encryption" {
  bucket = aws_s3_bucket.tf_s3_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "tf_s3_bucket_public_access_block" {
  bucket = aws_s3_bucket.tf_s3_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
