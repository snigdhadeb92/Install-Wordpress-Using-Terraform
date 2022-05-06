############## Lunch S3 Bucket ################
resource "aws_s3_bucket" "bucket" {
  #bucket = "my-test-bucket"

  tags = {
    Name        = var.bucket_name
    Environment = "Dev"
  }
}