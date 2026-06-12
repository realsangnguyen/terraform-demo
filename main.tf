resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "demo" {
  bucket = "${var.project_name}-sang-${random_id.suffix.hex}"

  tags = {
    Name        = "${var.project_name}"
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}
