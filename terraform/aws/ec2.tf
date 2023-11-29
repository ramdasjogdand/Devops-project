resource "aws_instance" "example" {
  ami             = "ami-0230bd60aa48260c6"  
  instance_type   = "t2.micro"
  key_name        = "techverito_key"  
 vpc_security_group_ids = [aws_security_group.instance_sg.id]  

  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install -y docker
    sudo service docker start
    sudo usermod -a -G docker ec2-user
    sudo curl -L "https://github.com/docker/compose/releases/download/<DOCKER_COMPOSE_VERSION>/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    sudo yum install -y aws-cli
    EOF

 tags = {
    Name = "techverito_test"
  }
}

resource "aws_security_group" "instance_sg" {  # Changed name to avoid confusion
  name_prefix = "example-instance-sg"
  vpc_id      = "vpc-0ead1ccc5da2db328"  

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
