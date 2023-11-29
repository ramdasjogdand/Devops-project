resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.instance_sg.id]

  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install -y docker
    sudo service docker start
    sudo usermod -a -G docker ec2-user
    sudo curl -L "https://github.com/docker/compose/releases/download/${var.docker_compose_version}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    sudo yum install -y aws-cli
    sudo yum install -y libxcrypt-compat
    EOF

  tags = {
    Name = "techverito_test"
  }
  
  lifecycle {
    ignore_changes = [tags]  # Ignore changes to tags after creation
  }
}

resource "aws_security_group" "instance_sg" {
  name_prefix = "example-instance-sg"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.security_group_ingress_port
    to_port     = var.security_group_ingress_port
    protocol    = "-1"
    cidr_blocks = [var.security_group_cidr_block]
  }

  egress {
    from_port   = var.security_group_ingress_port
    to_port     = var.security_group_ingress_port
    protocol    = "-1"
    cidr_blocks = [var.security_group_cidr_block]
  }
}

output "instance_public_ip" {
  value = aws_instance.example.public_ip
}
