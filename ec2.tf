data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

resource "aws_instance" "web" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
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
    Name        = "${var.project_name}-ec2"
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}
