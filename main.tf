resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "demo" {
  bucket = "terraform-demo-sang-${random_id.suffix.hex}"

  tags = {
    Name        = "terraform-demo"
    Environment = "sandbox"
    ManagedBy   = "terraform"
  }
}
