###########################
# S3 RESOURCES
###########################

resource "aws_s3_bucket" "film_s3_bucket" {
  bucket        = "${local.myprefix}-app"
  force_destroy = true

  tags = local.common_tags
}

resource "aws_s3_bucket_acl" "film_bucket_acl" {
  bucket = aws_s3_bucket.film_s3_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_ownership_controls" "s3_bucket_acl_ownership" {
  bucket = aws_s3_bucket.film_s3_bucket.id
  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_public_access_block" "public_block" {
  bucket = aws_s3_bucket.film_s3_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
  ignore_public_acls      = true
}

resource "aws_s3_bucket_versioning" "film_bucket_versioning" {
  bucket = aws_s3_bucket.film_s3_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_policy" "film_bucket_policy" {
  bucket = aws_s3_bucket.film_s3_bucket.id
  policy = data.aws_iam_policy_document.film_bucket_policy_document.json
}

resource "aws_s3_bucket_website_configuration" "film_bucket_website" {
  bucket = aws_s3_bucket.film_s3_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}

data "aws_iam_policy_document" "film_bucket_policy_document" {
  statement {
    actions = ["s3:GetObject"]

    resources = [
      aws_s3_bucket.film_s3_bucket.arn,
      "${aws_s3_bucket.film_s3_bucket.arn}/*"
    ]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.film_origin_access.iam_arn]
    }
  }
} 