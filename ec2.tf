# Get latest Amazon Linux 2023 AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

# EC2 Instance
resource "aws_instance" "web" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.web.id]

  user_data = <<-USERDATA
#!/bin/bash
set -ex
dnf install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Terraform Demo - Sang Nguyen</h1>" > /var/www/html/index.html
USERDATA

  user_data_replace_on_change = true

  tags = {
    Name        = "terraform-demo-ec2"
    Environment = "sandbox"
    ManagedBy   = "terraform"
  }
}
