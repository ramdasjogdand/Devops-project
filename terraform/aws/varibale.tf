variable "aws_region" {
  default = "us-east-1"
}

variable "vpc_id" {
  default = "vpc-0ead1ccc5da2db328"
}

variable "ami_id" {
  default = "ami-0230bd60aa48260c6"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "techverito_key"
}

variable "docker_compose_version" {
  default = "1.29.2"
}

variable "security_group_ingress_port" {
  default = 0
}

variable "security_group_cidr_block" {
  default = "0.0.0.0/0"
}

variable "ecr_repository_backend" {
  default = "techverito_backend"
}

variable "ecr_repository_frontend" {
  default = "techverito_frontend"
}